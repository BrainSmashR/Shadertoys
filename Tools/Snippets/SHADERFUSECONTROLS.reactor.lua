
function StandardShaderFuseTopControls()
  -- Branding
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
end

function StandardShaderFuseBottomControls()

  local version_info=''

  if dctlfuse_versionNo == nil then dctlfuse_versionNo='' end
  if dctlfuse_versionDate == nil then dctlfuse_versionDate='' end

  if dctlfuse_versionNo=='' and dctlfuse_versionDate=='' then
    version_info=''
  elseif dctlfuse_versionNo ~= '' and dctlfuse_versionDate=='' then
    version_info='Fuse version '..dctlfuse_versionNo
  elseif dctlfuse_versionNo == '' and dctlfuse_versionDate~='' then
    version_info=dctlfuse_versionDate
  elseif dctlfuse_versionNo ~= '' and dctlfuse_versionDate~='' then
    version_info='Version '..dctlfuse_versionNo..' - '..dctlfuse_versionDate
  end

  if version_info ~= '' then
    version_info=version_info..'<br />'
  end

  -- self:BeginControlNest("Shaderfuse Info", "Shaderfuse_Info", true, {})

  -- Separator
  self:AddInput( '<br />',"DctlFuseSeparatorLabel",{LINKID_DataType="Text",INPID_InputControl="LabelControl",LBLC_MultiLine=true,IC_NoLabel=true,IC_NoReset=true,INP_External=false,INP_Passive=true})

  -- Info Btn
  self:AddInput(dctlfuse_name.." Info ...", "DctlFuseInfoButton", {IC_ControlPage = 1,LINKID_DataType = "Text",INPID_InputControl = "ButtonControl",INP_DoNotifyChanged = false,INP_External = false,BTNCS_Execute = 'bmd.openurl("'..(dctlfuse_infourl~=nil and dctlfuse_infourl or 'https://nmbr73.github.io/Shadertoys/Shaders/'..dctlfuse_category..'/'..dctlfuse_name..'.html')..'")'})
  -- Info Txt
  self:AddInput('<p align="center">'
    ..'Shadertoy <a href="https://www.shadertoy.com/view/'..shadertoy_id..'" style="color:white; text-decoration:none; ">'..shadertoy_name..'</a> by <a href="https://www.shadertoy.com/user/'..shadertoy_author..'" style="color:#a0a060; text-decoration:none; ">'..shadertoy_author..'</a><br />'
    ..'<span style="color:#a06060; ">'..(shadertoy_license == "" and '&copy; '..shadertoy_author..' (CC BY-NC-SA 3.0)' or shadertoy_license)..'</span><br />'
    ..'DCTLified and DaFused by <a href="'..(dctlfuse_authorurl==nil and "https://nmbr73.github.io/Shadertoys/" or dctlfuse_authorurl)..'" style="color:#a0a060; text-decoration:none; ">'..dctlfuse_author..'</a><br />'
    ..version_info
    ..'Reactor package v'..SHADERFUSES_REACTOR_PACKAGE_VERSION..' created '..SHADERFUSES_REACTOR_PACKAGE_DATE..'<br />'
    ,"DctlFuseInfoLabel", {IC_ControlPage = 1, LINKID_DataType="Text",INPID_InputControl="LabelControl",LBLC_MultiLine=true,IC_NoLabel=true,IC_NoReset=true,INP_External=false,INP_Passive=true})


    -- self:EndControlNest()

  end
