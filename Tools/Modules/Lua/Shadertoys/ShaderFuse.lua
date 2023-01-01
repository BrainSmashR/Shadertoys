

-- Shadertoy.Name = "Rainbow Slices", -- optional, but should be given; the original name (defaults to Fuse.Name)
-- Shadertoy.Author = "fizzer",       -- mandatory
-- Shadertoy.ID = "XdsGD4",           -- mandatory
-- Shadertoy.License = "",            -- optional (defaults to CC BY-NC-SA)
-- Fuse.Name = "RainbowSlices",       -- optional (defaults to Fuse.FileName)
-- Fuse.Author = "nmbr73",            -- mandatory
-- Fuse.AuthorURL                     -- optional (nil for default, '' to supress)
-- Fuse.AuthorLogo                    -- optional (nil for default, '' to supress)
-- Fuse.Description                   -- optional
-- Fuse.FileName                      -- auto
-- Fuse.Category                      -- auto
-- Fuse.InfoURL                       -- auto
-- Fuse.isCompatible                  -- auto
-- Fuse.hasThumbnail = true|false     -- auto
-- Fuse.Version = "v1.0.0"            -- optional; but if given then it must be in 'v<MAJOR>.<MINOR>.<PATCH>' format; '' if empty
-- Fuse.Date = "2022-12-31"           -- optional; but if given then it must be in 'YYYY-MM-DD' format; '' if empty
-- Shadertoy.Description = ""         -- optional (description from Shadertoy.com) ... NOT USED YET
-- Shadertoy.Tags = []                -- optional ... NOT USED YET

-- Compatibility = 15 -- magic number for macOS_Metal+OpenCL & WindowsCUDA+OpenCL all being true
-- Compatibility.macOS_Metal = nil|true|false|'...'     -- optional (if not given, then it's incompatible!)
-- Compatibility.macOS_OpenCL = nil|true|false|'...'    -- optional (if not given, then it's incompatible!)
-- Compatibility.Windows_CUDA = nil|true|false|'...'    -- optional (if not given, then it's incompatible!)
-- Compatibility.Windows_OpenCL = nil|true|false|'...'  -- optional (if not given, then it's incompatible!)
--
-- true  == checked and it works
-- nil   == not tested yet
-- false == does not work (no more details)
-- '...' == does not work with '...' decribing the problem
--
-- Compatibility = {
--     macOS_Metal = nil,
--     macOS_OpenCL = nil,
--     Windows_CUDA = nil,
--     Windows_OpenCL = nil,
-- },


local ShaderFuse = {}



-- Folgende Variable nur vorübergehend zum Testen. Die unterschiedlichen
-- Varianten werden dann später in den verschiedenen Code-Generierungen
-- berücksichtigt werden müssen (Repository, Installer, Atom-Package).

local deployment_phase = 'DEVELOPMENT' -- DEVELOPMENT|PRERELEASE|REACTOR



function ShaderFuse.begin_create()


    -- Info Btn

    if deployment_phase == 'DEVELOPMENT' then

        self:AddInput(
            info.Shadertoy.Name.." Info ...",
            "DctlFuseInfoButton", {
                IC_ControlPage = -1,
                LINKID_DataType = "Text",
                INPID_InputControl = "ButtonControl",
                INP_DoNotifyChanged = false,
                INP_External = false,
                BTNCS_Execute = 'bmd.openurl("'.. ShaderFuse.Fuse.InfoURL ..'")'
        })

    end

    -- Branding
    local red = "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"
    local green = "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAMZlWElmTU0AKgAAAAgABgESAAMAAAABAAEAAAEaAAUAAAABAAAAVgEbAAUAAAABAAAAXgEoAAMAAAABAAIAAAExAAIAAAAVAAAAZodpAAQAAAABAAAAfAAAAAAAAABIAAAAAQAAAEgAAAABUGl4ZWxtYXRvciBQcm8gMy4xLjEAAAAEkAQAAgAAABQAAACyoAEAAwAAAAEAAQAAoAIABAAAAAEAAAAgoAMABAAAAAEAAAAgAAAAADIwMjM6MDE6MDEgMTA6Mzk6MjQATSwbywAAAAlwSFlzAAALEwAACxMBAJqcGAAAA7BpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDYuMC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iPgogICAgICAgICA8dGlmZjpZUmVzb2x1dGlvbj43MjAwMDAvMTAwMDA8L3RpZmY6WVJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOlhSZXNvbHV0aW9uPjcyMDAwMC8xMDAwMDwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KICAgICAgICAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjMyPC9leGlmOlBpeGVsWURpbWVuc2lvbj4KICAgICAgICAgPGV4aWY6UGl4ZWxYRGltZW5zaW9uPjMyPC9leGlmOlBpeGVsWERpbWVuc2lvbj4KICAgICAgICAgPHhtcDpNZXRhZGF0YURhdGU+MjAyMy0wMS0wMVQxMTowOToyNiswMTowMDwveG1wOk1ldGFkYXRhRGF0ZT4KICAgICAgICAgPHhtcDpDcmVhdGVEYXRlPjIwMjMtMDEtMDFUMTA6Mzk6MjQrMDE6MDA8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOkNyZWF0b3JUb29sPlBpeGVsbWF0b3IgUHJvIDMuMS4xPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgqOg6kaAAAHIklEQVRYCe1WS2xc1Rn+78tz55GxY2fsaR3HbuPgOCYJOEiUBRKqUFA3LHhIVXdZ9EGFWLCjSiUkkEDs2iVQ1AopLJBYIJAaBG1agSoIhSTENgxu4jgMsRN7PPaMxx7P3Hv5vvPPdTwOBMqmmx7n5pw5j//7/u//z0Pk/+V/rID1ffF3774rmU6X8lEUWZ7nXZ2YmKh+H1v/FYHBweHxyvLy3dVa5faNxvo+iaxeGLAiiRYcx7uUyWQupVI7itlsVzEIrP9MT5/9+NtIfScCe/eO3jo/X/xldbVyvxVFQxGsOp4tfo8nLura4oY0asEmViLhSy6X/zKdzvzbsqw38vmel06dOtXcnLCl8a0E+vt/9PDc3OzjYRj8xPFt2f/zvOw52iW9h1Ng4cBUKDb+li+syew/y/LpX+al8mVdaLi7u1d6dvUKSJyIovC5QmHi7BZs07wpgf78wCPFuctPYObA0H275M4n90iy24HmNtQ32kuA2oEkkRVimi1BM5SpF+flwz9eFgkiyWZ3Sl9fv9i2nIoi5/eFwtl3t5KgC19bhoZGHvmiOPMUTOfHH90N8AHp8F2xLQugITwEKtoWFGAW4J/pA5D03ZGV/O1ZufjXBVmvrQPcEt9PD9l2tLe7O3emVLo2F4N+LYGRkUMPFYsXn242G/l9D/bJHU/sgYeROACMjLdwGw2bQhMZLZLhZ+N3hDo94EnXYFJmTpZkba0mmUwWRNwhx7G6MpnUm+Vy2eTEDQQOHDg8trKy/Ex5aWEs1Z2Qoy/cInaC/tLX0BBBAAweggE1OAJwFHKhNhYVQlfXLWkpT65J+eIa+IaSSmXQb93qeR3lhYWr/+IaUG8vzWZwbGVl6S76NXqsT5wMDTPRQsSa6aZ/jLhGHTpgnG1NSO1lnrAcerTf1NVqRcKwiQ8KRfKLsbGxYQ60ERgdHR1E39FabRWVJUP37TRTAiueprAKwcRTcjTDGfRaWySklHIHfMkMJAAcIBRrqDESynizaT+AJe0EoqhjP+K+n5M70rbsGPQxgd7r1MgQQQDgMdWg5NwFJMLcYFDhI/ox1iLN1bnRHSZIGxsMRYCP+kY/Vav8v1WCIOwJgsCj9wnEn5I2DQUCxt4qIHcCtx77WVxDVIFJSJgHIMq23+Nyz2CLBkYBOgAOh/btG7vN5eK4YJv4yjySRqVhuh1MZqGnbPG3C++wxQ01hod98bgJBdGggiGCVfUKTklDikoZcJr8geM4A6ouf6JAGtt1XWaqrJcbUi9BLgCo9HriEdbIvElIFVFytKLKsKVJaUsZpyQlsC2nJb+SAJnONgJYQZ6SSCRZyRd/XzJe0xDjHRccR0ZeB7PpJWO+3ZB6L1K9UpfS5KpxyvVUcJMCaqxj+zrTnU7vMPXkn+fFDnjJqArMbBpmTenj9GQuaKDUakyWfRN/4qEXiet6hoSCX/dmOwEzgmsV94wri4WaTL58zXivZwEBFMpr5YaC2UhCklQiDBn7lyfXZeKVq0ZW3/fNzmCOMcStstFGAAOwzpPMka7ObjPng+dmpfiPMtrqsR4wSEIYUjIkFCeWHlL8XZ2ryzu/KZgLyfVwbbuJFgHaJwkgWfbydgLr5jDB5ZFKp3F0po2Bt39bkPO4Zjk59pIehpi8eTbAIClS4vn3V+XNB6akOl83l1cymYKiIAe7Nm6rlgJXsOUvt21DmFi0rKgBZh4ndkIFGlxfW5XTz87IzOsLcujXeem/Z6dYCWy/kAQ0JGAjc5+sydRLV+QiLiA8XAyY7xO8A59jPvWcKsg5vA/OtBFwnOZUGFqTIHDYtnVBNttpFq6uVuUann3vPDYtju9I7mBG0r2eOK6DF1HDZHqtVIdGjC9uTmxn7iYmn4s5zCnaxI3YUsD6GyYid7YUPCxnR0YOnoTzh/F4MIt4bCaTaRhxzbXaaGxIsB7I/OkVwECeLYXSUjkFJbAreLC2frvGEYYB0z5y3fA1Lm0jwI4giJ6HjXEYupey0RuSUOkcjDek2Wyi1puN4wSOwUlA1fMA7rbANQTs17lyAs5OE++G90CpdHUpl+ubxdgYQmHu0hhASSD2SChKSoJbJWafep0w4Lj38ZtfHAKmsfVKvV49/o0PErLCY+FSb2/vDJ78o0jMHyqwbh/NZs0PJUAiKjfJxJJrrSQ1/mbrnQSZ459//tkV4rDcoIB2GxIXdu3KTQP8xzgXBqEGpNUYE1hljlVgHcutKpAMiV0Ht16Fksenps6djzFuSoCDi4vXZvC0/hjgnQA/qCRIROPMjI4VUcBYGc8QbMW8COA/JJPO786fP8fQtpXNM7Gtd9uPI0eOeJXKxq9wRjyEfLwHH4p5Wpn6+nRNRoYMhcBvYe6JQuGTt6/PaW99JwLxkuHh4axt+z+DGndjZ4zD+DDGeGbTzhK+GYBPIm8+wsvnPRw0p9F30/IVNi7JpesvX9QAAAAASUVORK5CYII="
    local gray = "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"
    local size = 16
    red = '<img height="'.. size ..'" width="'.. size ..'" src="data:image/png;base64,'.. red ..'" />'
    green = '<img height="'.. size ..'" width="'.. size ..'" src="data:image/png;base64,'.. green ..'" />'
    gray = '<img height="'.. size ..'" width="'.. size ..'" src="data:image/png;base64,'.. gray ..'" />'


    if deployment_phase == 'REACTOR' then

        self:AddInput('<p align="center"><a href="https://github.com/nmbr73/Shadertoys"><img height="20" width="210" src="data:image/png;base64,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" /></a></p>',
            "DctlFuseBrandLabel", {
            IC_ControlPage = -1 ,
            LINKID_DataType = "Text",
            INPID_InputControl = "LabelControl",
            LBLC_MultiLine = true,
            IC_NoLabel = true,
            IC_NoReset = true,
            INP_External = false,
            INP_Passive = true,
        })

    else

        local label = ''

        if ShaderFuse.Fuse.isCompatible and ShaderFuse.Fuse.hasThumbnail then

            local branding ='<img height="18" src="data:image/png;base64,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" />'

            label = '<p align="center"><a href="https://github.com/nmbr73/Shadertoys">'.. branding ..'</a></p>'


        else

            if ShaderFuse.Fuse.hasThumbnail then
                label = label .. green
            else
                label = label .. red
            end

            for _ , k in pairs({'Windows_CUDA','Windows_OpenCL','macOS_Metal','macOS_OpenCL'}) do

                if info.Compatibility[k] == nil then
                    label = label .. gray
                elseif info.Compatibility[k] == true then
                    label = label .. green
                else
                    label = label .. red
                end
            end

            label = '<p align="center">'.. label ..'</p>'

        end

        self:AddInput(label,
            "DctlFuseBrandLabel_dev", {
            IC_ControlPage = -1 ,
            LINKID_DataType = "Text",
            INPID_InputControl = "LabelControl",
            LBLC_MultiLine = true,
            IC_NoLabel = true,
            IC_NoReset = true,
            INP_External = false,
            INP_Passive = true,
        })

    end
end

function ShaderFuse.end_create()

    local version_info=''

    if ShaderFuse.Fuse.Version =='' and ShaderFuse.Fuse.Date == '' then
      version_info=''
    elseif ShaderFuse.Fuse.Version ~='' and ShaderFuse.Fuse.Date == '' then
      version_info='Fuse version '.. ShaderFuse.Fuse.Version ..'<br />'
    elseif ShaderFuse.Fuse.Version =='' and ShaderFuse.Fuse.Date ~= '' then
      version_info=ShaderFuse.Fuse.Date ..'<br />'
    elseif ShaderFuse.Fuse.Version ~='' and ShaderFuse.Fuse.Date ~= '' then
      version_info='Version '.. ShaderFuse.Fuse.Version ..' - '.. ShaderFuse.Fuse.Date ..'<br />'
    end

    -- self:BeginControlNest("Shaderfuse Info", "Shaderfuse_Info", true, {})

    -- Separator
    self:AddInput( '<br />', "DctlFuseSeparatorLabel", {
        LINKID_DataType = "Text",
        INPID_InputControl = "LabelControl",
        LBLC_MultiLine = true,
        IC_NoLabel = true,
        IC_NoReset = true,
        INP_External = false,
        INP_Passive = true
    })


    -- Info Btn

    if deployment_phase ~= 'DEVELOPMENT' then

        self:AddInput(
            info.Shadertoy.Name.." Info ...",
            "DctlFuseInfoButton", {
                IC_ControlPage = 1,
                LINKID_DataType = "Text",
                INPID_InputControl = "ButtonControl",
                INP_DoNotifyChanged = false,
                INP_External = false,
                BTNCS_Execute = 'bmd.openurl("'.. ShaderFuse.Fuse.InfoURL ..'")'
        })

    end

    -- '&copy; '

    -- Info Txt
    self:AddInput('<p align="center">'
      ..'Shadertoy <a href="https://www.shadertoy.com/view/'.. ShaderFuse.Shadertoy.ID ..'" style="color:white; text-decoration:none; ">'.. ShaderFuse.Shadertoy.Name ..'</a> by <a href="https://www.shadertoy.com/user/'.. ShaderFuse.Shadertoy.Author ..'" style="color:#a0a060; text-decoration:none; ">'.. ShaderFuse.Shadertoy.Author ..'</a><br />'
      ..'<span style="color:#a06060; ">'.. ShaderFuse.Shadertoy.License ..'</span><br />'
      ..'DCTLified and DaFused by <a href="'.. (ShaderFuse.Fuse.AuthorURL == '' and "https://nmbr73.github.io/Shadertoys/" or ShaderFuse.Fuse.AuthorURL)..'" style="color:#a0a060; text-decoration:none; ">'.. ShaderFuse.Fuse.Author ..'</a><br />'
      ..version_info
      -- ..'Reactor package v'..SHADERFUSES_REACTOR_PACKAGE_VERSION..' created '..SHADERFUSES_REACTOR_PACKAGE_DATE..'<br />'
      ,"DctlFuseInfoLabel", {
        IC_ControlPage = 1,
        LINKID_DataType="Text",
        INPID_InputControl="LabelControl",
        LBLC_MultiLine=true,
        IC_NoLabel=true,
        IC_NoReset=true,
        INP_External=false,
        INP_Passive=true
    })

end





function ShaderFuse.init(filepath)

    local fuseAuthors = {
        JiPi = {
            URL   = "https://www.youtube.com/c/JiPi_YT",
            Logo  = 'width="259" height="60" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQMAAAA8CAYAAABiit8HAAABhGlDQ1BJQ0MgcHJvZmlsZQAAKJF9kT1Iw0AcxV9Ta6VUROwg4pChOlkQFXHUKhShQqgVWnUwufQLmjQkKS6OgmvBwY/FqoOLs64OroIg+AHi5uak6CIl/i8ptIj14Lgf7+497t4BQr3MNKtrHNB020wl4mImuyoGXxFAPwYQQrfMLGNOkpLoOL7u4ePrXYxndT735+hVcxYDfCLxLDNMm3iDeHrTNjjvE0dYUVaJz4nHTLog8SPXFY/fOBdcFnhmxEyn5okjxGKhjZU2ZkVTI54ijqqaTvlCxmOV8xZnrVxlzXvyF4Zz+soy12kOI4FFLEGCCAVVlFCGjRitOikWUrQf7+Afcv0SuRRylcDIsYAKNMiuH/wPfndr5ScnvKRwHAi8OM7HCBDcBRo1x/k+dpzGCeB/Bq70lr9SB2Y+Sa+1tOgR0LcNXFy3NGUPuNwBBp8M2ZRdyU9TyOeB9zP6piwwcAuE1rzemvs4fQDS1FXyBjg4BEYLlL3e4d097b39e6bZ3w/7WnJ3kCw/5wAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAAd0SU1FB+UFERMQKMsPOJkAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAAYeUlEQVR42u2dfXRW1b3nP/uc87wnT5KHBEIS8g4pBEFMBLEWgYte6bW39bXS6q2zLNTxeltn3enQuavWttNpbZdtdTqdVjreVVu7bou2eu8M5YpUBXE0FFB5DyQBkpAE8vK8v5zXPX+kIloICUIS6PmslZU8ec7e55y99++7f/t39tkbxpHFjddIXFxcJiXqeJ1oWcNyWV1Yi2JovX3p3p1u0bu4TC6UM/1z6bzrZFPl/DUX6iTzS69a4Q8FORLr4O2TO9e5xe7icomIwQxRQzUzn7xQJxEEX1JCfrYdeE24Re7icgmJQetQB7kC+4KdJL+0kOMDx93SdnG5FJk3a0HtsuYb5UfKmj70cGHF0k+7gUMXl0vRMwDYfeitjrRhM3Vq5YcaLjQ1L5YZJ+mWtIvLJEcb6cvtu/8gbviru0bVq89deI20bPtZj6KskKbRvPfttzoA5i75a57+wdfdWMFfOA8++KD8zne+c37DzPz8c7afZDJ5qp0KIZBy5Gbb2dlJY2PjiPl+85vflA899BBSShzHOfX7TH+f/nmk74V475SWZZFIJEgmkySTSfbt28fOnTvZsGHDh7KXdevWyVWrVo0pzf333z+yGAC89Idfixtuu1e+9Nufn7rApts+JWsWLKG2cgH1U2oo1rz4pCRr2XcMqIIer93enDtJ1skwtaIUfvB11xpcyMvLu+Tyzs/PH/dySiQScsOGDaxfv54XXnhBjFd5aKM5yAkGufk//xc5hGRO841E/GXMDxWwIGRTlQ+esCDn0ZCWQi6R4WhPipZ+nb2Kl4PZJCsffEhu/J+Pu96Bi8soCIfDrFq1ilWrVrF161b5yCOP8Oqrr150+xmVGLzZvp3/9PdPc6jXIJQz+duyEIuqw2hFQSxNRQD5EpCScIXD1Dk2ddEMG/54mDcO99M9/1pm3j4kDz/3C1cQXFxGgZQSIQRLlixhw4YNfO1rX5Pf//73L6r9KKO6sPxSTu5ro6zvBJ+aVcmiK6vQSvxITaDlILWrh+hL++l/dS/ypA7SS6Qon7uuqeHO6QkGEkHmLrjerWEXl1FyetwjGAzy2GOPsWbNGjnhYjBlwTLsnEljvs1H505D9QC2B9Gv0P1aOx7LQ+H0UkpmVLL/lTfoe6sNYat4VT9X1zUwTzGZqgiuWvG37iNGl4vam15ugnD6fX3ve99j2bJl8mKV26jEoKqmkeOtB1g8uwqPlsHBBAv6txyg8JjF84//C39326f53tovUlvg59Af3oABgABWvpdbaiuxTwxQMXMuhQ3zV7jN1uVi96aXoygUFBTwwAMPXHCBfDf/UYlBiW3idPdS7BGgZNAxwIDU28d5fdPLfOdf/xfr+3fyPzb+jh8/8b+ZnlfI3u1bQdGxpcSfieETgmmVs9BF6CW32bqMtiGP1bhPf3Q3UtrTj7uUvJrbb7+d5cuXy9HmN5b7PGcA8YqFH5XZI0eI+H3Ekgn8WR9qAJAhDF3HNh18Qo2q0ipyBKRTWXInYgQiIWQ2y0A2QdZOI1SLokgeCMNt5S4XHF3Xz0swJlvvPxruuusuXn755XOWh6IoYxLTcz9NcATpkwnKQyH6Y0OIPhU138JvKvjKYb5Wwj/Glhbtb99H1ZQSVly9lG173ua2O5bRF08QjSeIJYawhCS/MALC57Zcl1EbiGVZozrW7/dPGgtPpVL8+te/RkqJruvouk44HKayspKKigoaGxs/VP7XXnvtiN+vWbNGrFkz9rcIzikGe3ZsE5+96e9ldqiNlKYSjOeQOYGhSKZeP4tj//oKyxvm8ZkrbwZH5f927qBs5UK682LEkwkGB9Mcj1koTjGpbvDpAbJuO3e5wO7zZGP16tVnFadFixYNrV69uui+++47r7wbGxtZtGjRUEtLS+RCXvOo5hkodgWpzFEyaQMjA17hwSoQxAs8VN13Ez1/7KDjeIKUlaTiU3+FLPHROxAj3j9IT+cxjsbLyS+spfWtLjSj0G3hLqPGcZxL0qMZiZaWlkhLSwuHDx+Wjz766HkJZENDQ1FLSwvjLgb7j/iZPX0xR7sT5IVUpuSp+FDxoyJCKjOWfwTTkuR0k0Q6TjSVIJGGzr48uvpnMqDfTGdPL+379+LD67ZwlwvuGdx9993yTGlHMsxnnnlGTOQ1f/e73xU33nijXL58+ZjFZqRp0itWrJClpaVjut5f/epXYlRi0LdvF1O1G9ncF+Jgp+SqK2yqykyCfgW/L4RQFSxTEo1L+gaK6O4TdPbaRAcCpBJe4oMwNJDB7y3GkW7MwOXCewa//OUvx5Tv/v37eeaZZyb8/vbs2cNoxeB0cQuHw2c97s4772T16tVj1rDRvZuQTNDb3ovmn00yWcihNtA0E00oeDwqCJDSwbbA0AW5LOgZSS4F2YyBJQVF4QiOAVi628JdJnyYMFliEe3t7eeVLhAIjFo4LugwwTFPoNomuahCcgAUDTweiaJIhJBoikBB4Fhg5AS6AbZtoSgKAY8XqTnEB/uID3VQWOR6Bi4X3mjH2vgny+PFqqqqUd/b6dccj8cv+P2NSgxUJ59M0kLRQBGAA4qtoiFRFIEiQUpQJGgKoDnYUmAbEss0yTk7MdJeNGs+kcB0Qg2O3Nv6tPvSkssFE4OxNP7J9IRi3rx553VviUTigl/LqMTA45sPdimO40H1gOoBTRWoKCgOIB0EYFkg5LCXIBFIbGzbRnNUHEUnL6+I4rx5RIquYVpBk+waeJZDHe4iqS7jO0yYLF7BF7/4RXnDDTecV9qLIQYjTkeurly446or7pQzCm4iT9QQlBpeW6I5gCkRzrBLoDoKiq3gkQLNkXht8DoqmuOgoqOhkueZRnXFXArCgpLyKI898Q/814f/iY80Nj/qNnmX8Y4ZTDSPPPKI/Pa3v31eaS3L4je/+c0FV7SzegY1M5ofrS7+D00loZsxTC9ZVZLRHSzHRpUayGGvQCgSRQGJxNZAEwqmLbFtCxyBongJevMpCdVS5IWs1cqnV9dhaMfoavNx3dx/XCty/7z2QPtLrofgMqld+rGwevVqadvDK4yrqkpJScmpn5UrVxKJnP98oQs9v+CcYlBfvnJtVcHHSfRWECp/m9tWXkn3cYWtW3rRjQIcGRx2uRQQQqIIUKWCKR1AoikKmkdFk4K8knwKFciloLTOQ3F1kNde28mObZ1M88/mmlm3cqDdfX/JNerLwzMIhUKsW3fx9gp6/fXXL0q+ZxwmLP7Il+TMyO3ET0gS6R7sYCcls+N84j5JzfyDBINR8jUIKeATJl4svFLBI8ErbIKKQ9CrEM5zKCmV5BX0sOIGyCkbWPLJfAaz3fS0pdFOlDIzeDVGPERNZdMa12RcMbgcxOBixiQ6OjpYu3atGDcxaG4u4p/+2zyuumkPb/St4qWXf0HaOETK7iBcBJgGqsmw8Ss2fgX8EjQHvIDfKynKh0hQhZyJYe/mY7fA39xbQvOcCnpe0fG3N7Ng1idoPXmQd7o3cqTT3XbNFYPLZ5hwsfjRj3500fL+MzGondG0Jh6byr9v6uITt67k9nvqMeI2GzZsIK3H8Pgs0rF+FINhQbAkmm3jFRBQIaAIfI6KE7cwYzFKQgYzcvV0vQiRY038/r9L9vzbXLqOFLPr6BZaDj9JRh6sc6v58uZyDQSOJ08//TSPP37xFhb+s5iBFLB3dzuBdA/p/XncEHmcvEVbGNq3F73Vz1RZgJZppXBaHvOb59B7Mo6aCxFWAgQ8EAxIfJqF3+tHqIVkLZ0h/Tre+GOObFaQigUZ7M8Q1fcyILeS8eylo2t4jwWXv1zP4HxmzP0lsXnzZu69996LWkB/JgZHOneuO8LOdTqtsn/gQaZ5/pr8ohuoD6zk4G9VvF6HO5YtwKcJPLrJ1MISLASmdDBsQcZSiekqVgZMG3TDi5GBZEYQi2bJJNIUhINMKQgTi6v4RNCtaVcMzioErkDAc889xx133DFxS6Vn5fG6tv7/0+6t0MieuB5VCDQPeLzg9Sl4fQKPJlC14SmJwpHgKNiWwHIklumgZ0HPOiSzgK6Q7w9TWiOJZXtpb+uhfNrHKAtHMGV0R9vx7c2uybgxAzdm8H6+9a1v8fDDD4+LIp5VDDq63uqYXTIXwxrEb4GiCKQDuikw9OHHiaoQqJqDRwUQ4EgcW+A4EscB25ZoQqMgEidsFSAk9KY6ORJtIaWnuH7azZRWz6I//WZTG9tdi3FjBi7AoUOHePbZZ/nqV786rm7R2ecZVDQ/WiBq8ObqyKayaHlBNEUgJWALpFCG5xg4wxOOVFWgqgKhnK7owx8c4cfMQSxh0KMPb7umqTFmzvBTXpDPqoWfI2f2yJYj7sSjS41bbrlFVlVVnTOwNZK7/5cWL7Asi2w2SyKRIJvNntpn8e233+add95h8+bNE1IYZxWDSKBh7TWVdxJrbSBhZzANidenIhwHIUAKBw2BRwGvl2EhEMMvLEkpsG2JZYKpQzrnI53OkslGkVhoeHD8PuJmjko9n6vylxG8XkNiyu1HXnUFYRKxZMkSWV9fT319PTU1NdTX11NXV0dRUdGpY7Zv387jjz8+Yj4fXIzjdAEYSQii0eglV2apVGpUm8VONrQ/9wgW1M4puqP9immfQegzUEodMicVTFPHUhU86rBHoErxpzcYJbahYCvDlWtbYFkSyxSYxvDnrJ3GNMABhKIjlDS6rbP72FGKfSVUeaF2yhzuuf4f0HUh3+l5xRWECWLjxo2yrq6Ouro6FGVUK+mPamXiD4rBuTyBd8Wiv7/frZSJEoPZ01a2z5t6N0RnkE2DpRoU5ntJDCWxpQ8VgXAkQoBtDQ8b7D95BCCxLYFjK9g22NZw3MC2BCARqAghcNQ4GbGX/9d1AMvfyZyiRSysq+DKKZ9gaW0b7/S84tbMBNHQ0EBNTc2Y0oxmx9+RVuYZaVhx4sQJt1LGifdJ/8dqV8sF5Z/FTk5jMGkyaA5w7OQ+2hL/AuFOHJlGQaAK5dR+85YpsA0wDYmhDw8NHAscy8ZBYiFw1GGVV4WGonkw5CB24MDOfSd/Jvb2/juH+o6RTEPA8XB1w0K3ViaQPXv2jDnNggULznnM/Pnzz+t6uru73UoZbzGYXXGt/Ojsz6LF5pBOeulIbeOt1NfZp3zhCwljL6o/geHkcOTwy0mK+if1lmA77+1+IyU4yOFVUKSD5oCiKCiqD6EqmMRJc5S249ubq2cWrIlm24maAxzogQN9kDDLWFx3izsHdQLF4Hwe533pS186a6Lm5uZHR/ve/gfP3dHhzkcbdzGYOf06AqKeTA6S9iCDuZ0knF3Y/o7N2PkoIoQivMPDAQGKaqNqElVj+LcqUFUFVQXNA4rqoGgCqUqEYiEUG0tNkbAPo9MFwNHD8XW2J1bXHn+VfdF97GqHva0qmVzArZkJYvfu3ecV2b/nnnvO+t199923dqzDg3dFwRWDcRaDmWXXyeppi8ilvRgWpPUUvrwgQvFwpC3aEfIV4/WF8Pp9vPu0WBEqHk3g8Up8foHmkwgvKB5ACBACBzAVBwuDnDZAVusma518X2PziML2uTXXU1XciKNCWpwgY5+gembYXfRkAli/fr0wjLFvgdfU1ERLS4v85Cc/eaprX7ZsmfzpT38q77///vf1+CN5HqfvETg4OMjvf/97N5g8TmgAxZ56SsIzGYjpHDnRji/spXbqlQy0bwEglFdLKBABxYuZguENrwT8aW4BgOKoqLaDDTgOGEKiCx1TMbFVEwUF1dLw+EIgPacuYHp+I5FAA7Y5LE3RWB+O0AHVfYtxgvjd737HXXfdNeZ0Cxcu5IUXXmBoaEhqmva+oOHpHcDZPI8PzjfYunWrWxnj6RnMLF+4o7TwSnKxAgzLYSjXQTzXjRASn3e4Mr3+GZiKh0CBpGA6BIsdtCAo2vAqqIpHIj0WQhU4isDxDP8ILyh+ieKTKH4Tj8+D11uAorwXfU5kEwwlcyQsMLxH6U1sQ6jpuqOHo65/OEE8//zzHyp9JBIZ89ODM4nExo0b3coYT89AojRlMirJpApSIz/sRSmIsvvIdjJy2B6doEJOSrwm+FXwBxQIDE89tiwwbQdHgK1aOKhYjsDRTGxp4DgGUsti2wJbkcOLqKbfq/S32n8hcrJH5oUi2GaKXV2uWzgZhgoPP/ywbGxsHNeZgad7Bu3t7fzsZz9z28J4ikHb8TdFG2/SZ22RNcHPUFu1mKh1gNaTB2jreVkAJJ3DhDzg2AKvnY8qBT4VVKGAB6QXbHt43wTHsbAsA0OmMZ0Ulp3FVuM4wo/tZHDsLI7y/kkqBzo2u5U+yXjuueeYO3fumI14rP87m2fw4x//2K2EiYgZALxz5DmRmXH00eNMX6vLHG09770nMJTdSUEELJEjY0cIaGGk5kcbjhbiSImtGNiqiW5lMdUshpPGdNI40sBSkuBY2FYK20xgy5Rb8pOcb3zjG6K+vl7efffdY3bvx/K/M7FhwwZ++MMfuh3ERIkBwOGuHV8BvvLBg6KJlyiISMJBDZ/Xg9QElmbgCA+g4AgLxzGwHR3LNjGtLJadwrZ0pGOBMLAVsElikQBh7nSLfvJzzz33iLq6Orl48eJReQNj9SLOlMeWLVu4+eabz1sITn8aca5jLnfGWkejmnzeefQN0XnsVaTSi+2LkgvE0QNxzEAcM5DA8iUxfUlMbxpLS+J4kzieNLaWxtKySC2HVFNYShpHFXh8kSbX1C4NvvzlL59xP8APKwRnymPjxo0sXbr0Q3kEH9yGbLSezOXIWO9zVGIws7ao1pFG1PE4OKqBpaQwRRxdS2F4MlhaBtuTw9Fy4DOQmomjGjhaDlszsDUHLSDwBbyo/nyC4enMqF5Q+27+117zMXfG4STl9ddfF/X19eLpp5/+0L3qmRrnu/k98cQTfPzjH3eHBhfQKxgrZxSD65aukZ/5ux/IK5tulQCHO6IdRVNqi0KhEoTqx+/3kzOGiCeOkEweI2fH0e0UOSdFxkxgCh0UhUikjEjRNMKRWiJTyvD5AgSDxZSWzwV1avusWUvlT37yonziJ1t45FvrXUGYxNx7773i85//PF1dXRfU7d62bRu33347Dz30kCsEEzQ8OGPMAKBp4efk/Ob/iK0UM9szB5spMp5op3bWEoL5U0kkbXQjQS5n4vOGCBeEOH78MKowyQsXk8sYFE2Ziq7rhCNT8fsjpNMniccGEKrGDSuWMKehhMOtcxBolFVey8FDaebMuYnHfvCyHOzfR3v7W6xf/89u45hkPPXUU+Kpp57igQcekLfeeivNzc0UFBSMueENDQ2xadMmXnzxRX7+85+L8TSI8VhIZaJjEiPFZEYsL4D6hpvkdUs+h+Ktw3CGe36BTTabRtd1VNVDwJ9HTk9j2zr+YAifdwoSm77uXRw5/DKJxACz5ywhmQ4yd34z7R1tVFbMori4mlCeRTgYJh6LUTotRE2tB6+SwedVEMJPT2+Kkil5CGGhqRqdPSd48snH6Dj8h7rOY+7KyZOZG2+8UTY0NFBdXU1NTQ1FRUX4fD78fj8AsViMWCzGwMAABw4c4ODBg2zcuNEV+kmINqO6aU3jlZ8mUraMeCKDkThONnUS2/EzvayKggKNaKyHvt69DJ5owzRtamctJlJVTizeTyLZTzIVx+/3kssOYho5kqkYgUABsUSckmKdqukKpdPhWFeYXW+3kzVqKC1RqKn04/VCIJjHnv1RioqK0E2L3j4TSxQj8ayvryn8StuR2Ga3qiYnmzZtEps2bXIL4nIQA4BMNkEiEUXPmeiZNIaZo3jqVEpLy0gnU8TigkSsm8GBQ+SFyqgor0HVAji2iZHLoQg/08sKiEV3sHvHv4nk4MIdvkBVUyDvCirLQyiyCmmDYxkMDQ3S2q7g9VXj6wOPCoNxONydIXs4hSBBfHAPPZ1v0HXMXTHZxWXcxKDr6M51wby6J4unlKN6pmNJSCbSVJRLVOmgqSEEDqoawrQDlJZVAaDnbJKpLIgYwt7L1pfePOX6tR7Y3gzbKa/qlWXlfvKC9xFLwcn+IQb6u8jm4oSCPtKpaQg0YskY3ccOER1qxTE7ONHTQkfrVteVdHEZb8+gde96gX10R164oimXtTEth3DoGhRh4PXPRvXk4Q94CHhS9PfvIb+3lLz8BgwjjpmLcaT9zTMa7vFj28Tzx7Yx8DfT5YxpDt1Ht9HevodgfiV+z6eIRuegqH7isVZa9/+Wfbt+4QqAi8tEisHpvfm7SDspg6FqtLwwRjZKLtuDabbu3PXm9uZkfL8sr2gknRxi8MTBL5zrJK9tuOcDRv4mmojJ0vJrUISHgf532LfrOVcIXFwmkBENsH7W1evDhWV3SGziQ8frOtrcyL6Ly+XK/we8M0nmgAJ7dAAAAABJRU5ErkJggg=="',

        },
        nmbr73 = {
            URL   = "https://www.youtube.com/c/nmbr73",
            Logo  = 'width="212" height="41" src="data:image/png;base64,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"',
        },
    }



    filepath = filepath ~= nil and filepath or debug.getinfo(2, "S").source:sub(2)
    assert(filepath,"filepath could not be determined")

    -- print("init: '".. filepath .."'")


    local path, category, fusefilename = filepath:match("(.*/)([^/]+)/(.+)%.fuse")
    assert(path ~= nil and category ~= nil and fusefilename ~= nil, "filepath missmatch")

    dofile(path .. category .. '/' .. fusefilename .. '_info.lua')






    -- mandatory fields
    assert(info ~= nil, "no info")
    assert(info.Shadertoy ~= nil, "no info.Shadertoy")
    assert(info.Shadertoy.ID ~= nil, "no info.Shadertoy.ID")
    assert(info.Shadertoy.Author ~= nil, "no info.Shadertoy.Author")
    assert(info.Fuse ~= nil, "no info.Fuse")
    assert(info.Fuse.Author ~= nil, "no info.Fuse.AUthor")

    -- auto fields
    assert(info.Fuse.Category == nil, "Fuse.Category must not be set explicitely")
    assert(info.Fuse.FileName == nil, "Fuse.FileName must not be set explicitely")
    assert(info.Fuse.FuRegister == nil, "Fuse.FuRegister must not be set explicitely")
    assert(info.Fuse.isCompatible == nil, "Fuse.isCompatible must not be set explicitely")
    assert(info.Fuse.InfoURL == nil, "Fuse.InfoURL must not be set explicitely")
    assert(info.Fuse.hasThumbnail == nil, "Fuse.Thumbnail must not be set explicitely")


    info.Fuse.Category = category
    info.Fuse.FileName = fusefilename

    -- defaults / optional
    if info.Fuse.Name == nil then info.Fuse.Name = fusefilename end -- Fuse.Name defaults to filename
    if info.Shadertoy.Name == nil then info.Shadertoy.Name = info.Fuse.Name end -- Shadertoy.Name defaults to Fuse.Name
    if info.Shadertoy.License == nil then info.Shadertoy.License = "© "..info.Shadertoy.Author.." (CC BY-NC-SA 3.0)" end -- Shadertoy.com licenses defaults to CC BY-NC-SA 3.0 if not explicitely stated otherwise
    if info.Fuse.Description == nil then info.Fuse.Description = '' end
    if info.Shadertoy.Tags == nil then info.Shadertoy.Tags = {} end



    if info.Fuse.AuthorLogo == nil then
        if fuseAuthors[info.Fuse.Author] ~= nil then
            info.Fuse.AuthorLogo = fuseAuthors[info.Fuse.Author].Logo
        else
            info.Fuse.AuthorLogo = ''
        end
    end

    if info.Fuse.AuthorURL == nil then
        if fuseAuthors[info.Fuse.Author] ~= nil then
            info.Fuse.AuthorURL = fuseAuthors[info.Fuse.Author].URL
        else
            info.Fuse.AuthorURL = ''
        end
    end


    assert(info.Shadertoy.License ~= '', "Shadertoy.License must not be empty")

    -- optional Fuse.Version

    if info.Fuse.Version == nil then info.Fuse.Version = '' end

    if info.Fuse.Version ~= '' then
        -- TODO: führende Nullen ausschließen
        assert(info.Fuse.Version:match("^v([0-9]+)%.([0-9]+)%.([0-9]+)$"), "Fuse.Version must be v<MAJOR>.<MINOR>.<PATCH>")
        -- in Dev it's always 'a' (alpha); via installer it's 'b' (beta); in atom its '' (release candidate)
        info.Fuse.Version = info.Fuse.Version .. 'a'
    end

    -- optional Fuse.Date

    if info.Fuse.Date == nil then info.Fuse.Date = '' end

    if info.Fuse.Date ~= '' then
        assert(info.Fuse.Date:match("^([0-9][0-9][0-9][0-9])%-([0-9][0-9])%-([0-9][0-9])$"), "Fuse.Date must be YYYY-MM-DD")
    end


    -- auto Fuse.InfoURL
    --
    -- TODO: Bei Gelegehnheit die GitHub Pages so umstrukturieren, daß die Informationen unter
    -- der Shadertoy-ID abgelegt werden. Dabei ggf. eine Variant für Dev und eine für Reactor
    -- generieren.

    info.Fuse.InfoURL = 'https://nmbr73.github.io/Shadertoys/Shaders/'.. info.Fuse.Category ..'/'.. info.Fuse.FileName ..'.html'



    -- auto Fuse.Thumbnail

    info.Fuse.hasThumbnail = false

    local thumb = io.open(path .. category .. '/' .. fusefilename .. '.png', "rb")

    if thumb then
        local bytes = thumb:read(24)
        thumb:close()

        local signature = ''
        for i = 1, 8 do
            signature  = signature .. string.format( "%02x",string.byte( bytes, i ))
        end
        signature = signature .. 'XXXXXXXX'
        for i = 13, 24 do
            signature  = signature .. string.format( "%02x",string.byte( bytes, i ))
        end

        -- must be a 320x180 PNG image
        if signature == "89504e470d0a1a0aXXXXXXXX4948445200000140000000b4" then
            info.Fuse.hasThumbnail = true
        end
    end



    info.FuRegister = {}
    info.FuRegister.Name = "ST_"..info.Fuse.Name
    info.FuRegister.Attributes = {
        REGS_Category = "Shadertoys (dev)\\"..info.Fuse.Category,
        REGS_OpIconString = "ST-"..info.Shadertoy.ID,
        REGS_Company = info.Fuse.Author,
        REGS_URL = (info.Fuse.AuthorURL == nil or info.Fuse.AuthorURL == '') and "https://nmbr73.github.io/Shadertoys/" or info.Fuse.AuthorURL,
        REGS_OpDescription =
            "Shadertoy '".. info.Shadertoy.Name .."' (ID: ".. info.Shadertoy.ID ..") created by "
            .. info.Shadertoy.Author .." and ported by ".. info.Fuse.Author .. ". ".. info.Shadertoy.License .. "."
            .. (info.Fuse.Description ~= '' and " "..info.Fuse.Description.." " or " ")
            .. "This port is by no means meant to take advantage of anyone or to do anyone wrong: "
            .. "Contact us on Discord (https://discord.gg/75FUn4N4pv) and/or GitHub (https://github.com/nmbr73/Shadertoys) "
            .. "if you see your rights abused or your intellectual property violated by this work.",
        REG_Fuse_NoEdit = false,
        REG_Fuse_NoReload = false,
    }

    -- FUREISTER DONE ---------------------
    ShaderFuse.FuRegister = info.FuRegister
    ---------------------------------------

    -- Compatibility

    if info.Compatibility == 15 then
        info.Compatibility = {  macOS_Metal = true, macOS_OpenCL = true, Windows_CUDA = true, Windows_OpenCL = true, }
        info.Compatibility_issues = {  macOS_Metal = '', macOS_OpenCL = '', Windows_CUDA = '', Windows_OpenCL = '', }
        info.Fuse.isCompatible = true
    else

        if info.Compatibility == nil then info.Compatibility = {} end

        assert(info.Compatibility_issues == nil, "Compatibility_issues must not be set")

        info.Compatibility_issues = {}
        info.Fuse.isCompatible = true

        for k , _ in pairs(info.Compatibility) do
            assert( k == 'macOS_Metal' or k == 'macOS_OpenCL' or k == 'Windows_CUDA' or k == 'Windows_OpenCL', "invalid compatibility key")
        end

        for _ , k in pairs({'macOS_Metal','macOS_OpenCL','Windows_CUDA','Windows_OpenCL'}) do

            local v = info.Compatibility[k]
            local i = ''

            assert( v == nil or v == true or v == false, "invalid compatibility value")
            if v == nil then
                i = 'not checked'
                v = false
            elseif v == true then
                i = ''
            elseif v == false then
                i = 'does not work; no more details given'
            else
                i = v
                v = false
            end

            -- info.Compatibility[k] = v
            info.Compatibility_issues[k] = i
            info.Fuse.isCompatible = info.Fuse.isCompatible and v
        end
    end

    ---------------------------
    ---------------------------
    ShaderFuse.Compatibility = info.Compatibility

    ShaderFuse.Fuse = info.Fuse
    ShaderFuse.Shadertoy = info.Shadertoy


    -- return info
end


return ShaderFuse
