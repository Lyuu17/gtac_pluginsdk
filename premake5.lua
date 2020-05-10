workspace "gtac_pluginsdk"
   configurations { "Release", "Debug" }
   platforms { "Win32" }
   architecture "x32"
   location "build"
   objdir ("build/obj")
   buildlog ("build/log/%{prj.name}.log")
   
   language "C++"
   targetdir "output/%{prj.name}/"
   characterset ("MBCS")
   staticruntime "On"
   
   defines { "rsc_CompanyName=\"GTA Connected\"" }
   defines { "rsc_LegalCopyright=\"MIT License\""} 
   defines { "rsc_FileVersion=\"1.0.0.0\"", "rsc_ProductVersion=\"1.0.0.0\"" }
   defines { "rsc_InternalName=\"%{prj.name}\"", "rsc_ProductName=\"%{prj.name}\"", "rsc_OriginalFilename=\"%{prj.name}.dll\"" }
   defines { "rsc_FileDescription=\"A GTAC module with PluginSDK\"" }
   defines { "rsc_UpdateUrl=\"https://github.com/Lyuu17/gtac_pluginsdk\"" }
   
   includedirs { "includes", "includes/SDK/include", "source/plugin_sdk/shared" }

   filter "configurations:Debug"
      defines "DEBUG"
      symbols "On"

   filter "configurations:Release"
      defines "NDEBUG"
      optimize "On"

project "PluginSDK.III"
   files { "source/plugin_sdk/plugin_III/*.h", "source/plugin_sdk/plugin_III/*.cpp", "source/plugin_sdk/plugin_III/game_III/*", "source/plugin_sdk/plugin_III/game_III/rw/*", "source/plugin_sdk/plugin_III/game_III/meta/*", "source/plugin_sdk/shared/*", "source/plugin_sdk/shared/comp/*", "source/plugin_sdk/shared/extender/*", "source/plugin_sdk/shared/extensions/*", "source/plugin_sdk/shared/game/*" }
   includedirs { "source/plugin_sdk/plugin_III", "source/plugin_sdk/plugin_III/game_III", "source/plugin_sdk/shared", "source/plugin_sdk/shared/game" }
   kind "StaticLib"
   targetextension ".lib"
   defines "GTA3"
   defines "_CRT_SECURE_NO_WARNINGS"

project "PluginSDK.VC"
   files { "source/plugin_sdk/plugin_vc/*.h", "source/plugin_sdk/plugin_vc/*.cpp", "source/plugin_sdk/plugin_vc/game_vc/*.h", "source/plugin_sdk/plugin_vc/game_vc/*.cpp", "source/plugin_sdk/plugin_III/game_vc/meta/*", "source/plugin_sdk/shared/*", "source/plugin_sdk/shared/comp/*", "source/plugin_sdk/shared/extender/*", "source/plugin_sdk/shared/extensions/*", "source/plugin_sdk/shared/game/*" }
   includedirs { "source/plugin_sdk/plugin_vc", "source/plugin_sdk/plugin_vc/game_vc", "source/plugin_sdk/shared", "source/plugin_sdk/shared/game" }
   kind "StaticLib"
   targetextension ".lib"
   defines "GTAVC"
   defines "_CRT_SECURE_NO_WARNINGS"

project "PluginSDK.SA"
   files { "source/plugin_sdk/plugin_sa/*.h", "source/plugin_sdk/plugin_sa/*.cpp", "source/plugin_sdk/plugin_sa/game_sa/*.h", "source/plugin_sdk/plugin_sa/game_sa/*.cpp", "source/plugin_sdk/plugin_III/game_sa/meta/*", "source/plugin_sdk/shared/*", "source/plugin_sdk/shared/comp/*", "source/plugin_sdk/shared/extender/*", "source/plugin_sdk/shared/extensions/*", "source/plugin_sdk/shared/game/*" }
   includedirs { "source/plugin_sdk/plugin_sa", "source/plugin_sdk/plugin_sa/game_sa", "source/plugin_sdk/shared", "source/plugin_sdk/shared/game" }
   kind "StaticLib"
   targetextension ".lib"
   defines "GTASA"
   defines "_CRT_SECURE_NO_WARNINGS"

project "Module.PluginSDK.III"
   files { "source/%{prj.name}/*.h", "source/%{prj.name}/*.cpp", "source/%{prj.name}/resources/*.rc" }
   includedirs { "source/plugin_sdk/plugin_III", "source/plugin_sdk/plugin_III/game_III", "source/plugin_sdk/shared", "source/plugin_sdk/shared/game" }
   links "PluginSDK.III"
   kind "SharedLib"
   targetextension ".dll"
   defines "GTA3"

project "Module.PluginSDK.VC"
   files { "source/%{prj.name}/*.h", "source/%{prj.name}/*.cpp", "source/%{prj.name}/resources/*.rc" }
   includedirs { "source/plugin_sdk/plugin_VC", "source/plugin_sdk/plugin_VC/game_VC", "source/plugin_sdk/shared", "source/plugin_sdk/shared/game" }
   links "PluginSDK.VC"
   kind "SharedLib"
   targetextension ".dll"
   defines "GTAVC"

project "Module.PluginSDK.SA"
   files { "source/%{prj.name}/*.h", "source/%{prj.name}/*.cpp", "source/%{prj.name}/resources/*.rc" }
   includedirs { "source/plugin_sdk/plugin_SA", "source/plugin_sdk/plugin_SA/game_SA", "source/plugin_sdk/shared", "source/plugin_sdk/shared/game" }
   links "PluginSDK.SA"
   kind "SharedLib"
   targetextension ".dll"
   defines "GTASA"
