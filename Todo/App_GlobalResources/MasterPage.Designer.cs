//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Resources {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option or rebuild the Visual Studio project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Web.Application.StronglyTypedResourceProxyBuilder", "11.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class MasterPage {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal MasterPage() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Resources.MasterPage", global::System.Reflection.Assembly.Load("App_GlobalResources"));
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Language: .
        /// </summary>
        internal static string LanguageLabel {
            get {
                return ResourceManager.GetString("LanguageLabel", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Logged in as: .
        /// </summary>
        internal static string LoginLabel {
            get {
                return ResourceManager.GetString("LoginLabel", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to LogOut.
        /// </summary>
        internal static string LogOutButton {
            get {
                return ResourceManager.GetString("LogOutButton", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Projects.
        /// </summary>
        internal static string MenuItemProjects {
            get {
                return ResourceManager.GetString("MenuItemProjects", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tasks.
        /// </summary>
        internal static string MenuItemTasks {
            get {
                return ResourceManager.GetString("MenuItemTasks", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Team.
        /// </summary>
        internal static string MenuItemTeam {
            get {
                return ResourceManager.GetString("MenuItemTeam", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Really?.
        /// </summary>
        internal static string ReallyButton {
            get {
                return ResourceManager.GetString("ReallyButton", resourceCulture);
            }
        }
    }
}