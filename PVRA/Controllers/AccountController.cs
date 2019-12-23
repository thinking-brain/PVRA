using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using PVRA.Models;

namespace PVRA.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        public AccountController()
            : this(new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
        {
        }

        public AccountController(UserManager<ApplicationUser> userManager)
        {
            UserManager = userManager;
        }

        public UserManager<ApplicationUser> UserManager { get; private set; }

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var user = await UserManager.FindAsync(model.UserName, model.Password);
                if (user != null)
                {
                    if (user.Active)
                    {
                        await SignInAsync(user, model.RememberMe);
                        return RedirectToLocal(returnUrl);
                    }
                    else
                    {
                        ModelState.AddModelError("", "Usuario inactivo.");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Nombre de Usuario o contraseña incorrecto(a).");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/Register
        [Authorize(Roles = "ADMIN")]
        public ActionResult Register()
        {
            ViewBag.Roles = new MultiSelectList(new ApplicationDbContext().Roles, "Name", "Name");
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser() { UserName = model.UserName, Active = true };
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    foreach (var r in model.Roles)
                    {
                        await UserManager.AddToRoleAsync(user.Id, r);
                    }
                    return RedirectToAction("UsersList", new { Message = ManageMessageId.AddUserSuccess });
                }
                else
                {
                    AddErrors(result);
                }
            }

            // If we got this far, something failed, redisplay form
            ViewBag.Roles = new MultiSelectList(new ApplicationDbContext().Roles, "Name", "Name");
            return View(model);
        }

        //
        // POST: /Account/Disassociate
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public async Task<ActionResult> Disassociate(string loginProvider, string providerKey)
        {
            ManageMessageId? message = null;
            IdentityResult result = await UserManager.RemoveLoginAsync(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
            if (result.Succeeded)
            {
                message = ManageMessageId.RemoveLoginSuccess;
            }
            else
            {
                message = ManageMessageId.Error;
            }
            return RedirectToAction("Manage", new { Message = message });
        }

        //
        // GET: /Account/Manage
        [Authorize]
        public ActionResult Manage(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Su contraseña ha sido cambiada."
                : message == ManageMessageId.SetPasswordSuccess ? "Su contraseña ha sido establecida."
                : message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : message == ManageMessageId.Error ? "Ocurrió un error."
                : message == ManageMessageId.UpdateRolesSuccess ? "Se modificó correctamente."
                : message == ManageMessageId.AddUserSuccess ? "Se correctamente el nuevo usuario."
                : "";
            ViewBag.HasLocalPassword = HasPassword();
            ViewBag.ReturnUrl = Url.Action("Manage");
            return View();
        }

        //
        // POST: /Account/Manage
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public async Task<ActionResult> Manage(ManageUserViewModel model)
        {
            bool hasPassword = HasPassword();
            ViewBag.HasLocalPassword = hasPassword;
            ViewBag.ReturnUrl = Url.Action("Manage");
            if (hasPassword)
            {
                if (ModelState.IsValid)
                {
                    IdentityResult result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.ChangePasswordSuccess });
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }
            else
            {
                // User does not have a password so remove any validation errors caused by a missing OldPassword field
                ModelState state = ModelState["OldPassword"];
                if (state != null)
                {
                    state.Errors.Clear();
                }

                if (ModelState.IsValid)
                {
                    IdentityResult result = await UserManager.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.SetPasswordSuccess });
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }


        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Login", "Account");
        }



        [ChildActionOnly]
        public ActionResult RemoveAccountList()
        {
            var linkedAccounts = UserManager.GetLogins(User.Identity.GetUserId());
            ViewBag.ShowRemoveButton = HasPassword() || linkedAccounts.Count > 1;
            return (ActionResult)PartialView("_RemoveAccountPartial", linkedAccounts);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && UserManager != null)
            {
                UserManager.Dispose();
                UserManager = null;
            }
            base.Dispose(disposing);
        }

        [AllowAnonymous]
        public ActionResult Menu()
        {
            if (User.Identity.GetUserId() == null)
            {
                return null;
            }
            var roles = UserManager.GetRoles(User.Identity.GetUserId());
            if (roles.Contains("ADMIN"))
            {
                return PartialView("_AdminPartial");
            }
            if (roles.Contains("VENDEDOR"))
            {
                return PartialView("_VendedorPartial");
            }
            return PartialView("_UserPartial");

        }

        [Authorize(Roles = "ADMIN")]
        public ActionResult UsersList()
        {
            return View(new ApplicationDbContext().Users);
        }

        [Authorize(Roles = "ADMIN")]
        public ActionResult RestartPassword(string id)
        {
            var user = new ApplicationDbContext().Users.Find(id);
            if (user.UserName == "superadmin")
            {
                return RedirectToAction("UsersList", new { Message = ManageMessageId.Error });
            }
            return View(new RegisterViewModel() { UserName = user.Id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult> RestartPassword(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var db = new ApplicationDbContext();
                var user = db.Users.Find(model.UserName);
                user.PasswordHash = "AGo6bjEybjpmoFh0EwbHXayf+5ZdYtt4a5LYYa8tTkd412v9yCkZ0VhgbQcgrCVdEg==";
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                IdentityResult result = await UserManager.ChangePasswordAsync(user.Id, "123456", model.Password);
                if (result.Succeeded)
                {
                    return RedirectToAction("UsersList", new { Message = ManageMessageId.ChangePasswordSuccess });
                }
                else
                {
                    AddErrors(result);
                }
            }
            // If we got this far, something failed, redisplay form
            ViewBag.Roles = new MultiSelectList(new ApplicationDbContext().Roles, "Name", "Name");
            return View(model);
        }

        [Authorize(Roles = "ADMIN")]
        public ActionResult EditRoles(string id)
        {
            var user = new ApplicationDbContext().Users.Find(id);
            var roleListString = user.Roles.Select(r => r.Role.Name);
            if (user.UserName == "superadmin")
            {
                return RedirectToAction("UsersList", new { Message = ManageMessageId.Error });
            }
            ViewBag.Roles = new MultiSelectList(new ApplicationDbContext().Roles, "Name", "Name", roleListString);
            return View(new EditRoleViewModel() { Id = user.Id, Active = user.Active });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult> EditRoles(EditRoleViewModel model)
        {
            var db = new ApplicationDbContext();
            var user = new ApplicationDbContext().Users.Find(model.Id);
            UserManager.FindById(model.Id).Active = model.Active;
            foreach (var r in db.Roles)
            {
                UserManager.RemoveFromRole(user.Id, r.Name);
            }
            if (ModelState.IsValid && model.Roles != null)
            {
                foreach (var r in model.Roles)
                {
                    await UserManager.AddToRoleAsync(user.Id, r);
                }
                return RedirectToAction("UsersList", new { Message = ManageMessageId.UpdateRolesSuccess });
            }
            // If we got this far, something failed, redisplay form
            ViewBag.Roles = new MultiSelectList(new ApplicationDbContext().Roles, "Name", "Name");
            return View(model);
        }

        [Authorize(Roles = "ADMIN")]
        public ActionResult Delete(string id)
        {
            var user = new ApplicationDbContext().Users.Find(id);
            var roleListString = user.Roles.Select(r => r.Role.Name);
            return View(new RegisterViewModel() { UserName = user.UserName, Roles = roleListString});
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public ActionResult Delete(RegisterViewModel model)
        {
            UserManager.FindByName(model.UserName).Active = false;
            return RedirectToAction("UsersList", "Account");
        }

        public JsonResult CheckUserName(string userName, string id = "")
        {
            var users = new ApplicationDbContext().Users;
            var db = new PvraDataEntities();
            var result = false;
            if (id == "")
            {
                var item = users.FirstOrDefault(i => i.UserName.ToLower() == userName.ToLower());
                if (item == null)
                {
                    result = true;
                }
            }
            else
            {
                var item = users.FirstOrDefault(i => i.UserName.ToLower() == userName.ToLower() && i.Id != id);
                if (item == null)
                {
                    result = true;
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private async Task SignInAsync(ApplicationUser user, bool isPersistent)
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = await UserManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool HasPassword()
        {
            var user = UserManager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PasswordHash != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            Error,
            UpdateRolesSuccess,
            AddUserSuccess
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        private class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties() { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}