header = <<HEADER
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
  	<key>Ancestors</key>
  	<array>
  		<string>com.apple.dt.unit.base</string>
      <string>com.apple.dt.unit.iOSReferenceCounting</string>
      <string>com.apple.dt.unit.macReferenceCounting</string>
  	</array>
  	<key>Platforms</key>
  	<array>
  		<string>com.apple.platform.iphoneos</string>
      <string>com.apple.platform.macosx</string>
  	</array>
  	<key>Concrete</key>
  	<true/>
  	<key>Definitions</key>
  	<dict>
  		<key>___PACKAGENAMEASIDENTIFIER___.h</key>
  		<dict>
  			<key>Path</key>
  			<string>___PACKAGENAMEASIDENTIFIER___.h</string>
  			<key>TargetIndices</key>
  			<array>
  				<integer>0</integer>
  				<integer>1</integer>
  			</array>
  		</dict>
  	</dict>
    <key>Description</key>
    <string>This template builds a static library that links against the Foundation framework.</string>
  	<key>Identifier</key>
  	<string>com.buttonsAndLights.cocoaTouchStaticLibrary</string>
  	<key>Kind</key>
  	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
    <key>Project</key>
    <dict>
      <key>SharedSettings</key>
      <dict>
      </dict>
    </dict>
  	<key>Nodes</key>
  	<array>
  		<string>___PACKAGENAME___-Prefix.pch:objC:importFoundation</string>
  		<string>___PACKAGENAMEASIDENTIFIER___.h</string>
  	</array>
  	<key>Options</key>
  	<array>
  		<dict>
  			<key>Default</key>
  			<string>true</string>
  			<key>Description</key>
  			<string>Whether a unit test bundle should be created</string>
  			<key>Identifier</key>
  			<string>includeUnitTests</string>
  			<key>Name</key>
  			<string>Include Unit Tests</string>
  			<key>SortOrder</key>
  			<integer>1</integer>
  			<key>Type</key>
  			<string>checkbox</string>
  			<key>Units</key>
  			<dict>
  				<key>true</key>
  				<array>
  					<dict>
  						<key>Components</key>
  						<array>
  							<dict>
  								<key>Identifier</key>
  								<string>com.apple.dt.unit.cocoaTouchFrameworkUnitTestBundle</string>
  								<key>Name</key>
  								<string>___PACKAGENAME____Tests</string>
  							</dict>
  						</array>
  					</dict>
  				</array>
  			</dict>
  		</dict>
  	</array>
HEADER
start_targets = <<START_TARGETS
  	<key>Targets</key>
  	<array>
START_TARGETS
start_ios_target = <<START_IOS_TARGET
      <dict>
        <key>Name</key>
        <string>___PACKAGENAME___</string>
        <key>ProductType</key>
        <string>com.apple.product-type.library.static</string>
        <key>Ancestors</key>
        <array>
          <string>com.apple.dt.unit.base</string>
          <string>com.apple.dt.unit.iPhoneBase</string>
        </array>
        <key>SharedSettings</key>
        <dict>
START_IOS_TARGET
shared_framework_settings = <<SHARED_FRAMEWORK_SETTINGS
          <key>DSTROOT</key>
          <string>/tmp/___PACKAGENAMEASIDENTIFIER___.dst</string>
          <key>GCC_PRECOMPILE_PREFIX_HEADER</key>
          <string>YES</string>
          <key>GCC_PREFIX_HEADER</key>
          <string>___PACKAGENAME___/___PACKAGENAME___-Prefix.pch</string>
          <key>OTHER_LDFLAGS</key>
          <string>-ObjC</string>
          <key>SKIP_INSTALL</key>
          <string>YES</string>
          <key>DEAD_CODE_STRIPPING</key>
          <string>NO</string>
          <key>COPY_PHASE_STRIP</key>
          <string>NO</string>
          <key>STRIP_STYLE</key>
          <string>non-global</string>
          <key>PUBLIC_HEADERS_FOLDER_PATH</key>
          <string>include/$(PRODUCT_NAME)</string>
SHARED_FRAMEWORK_SETTINGS
end_ios_target = <<END_IOS_TARGET
          <key>SDKROOT</key>
          <string>iphoneos</string>
  			</dict>
  			<key>BuildPhases</key>
  			<array>
  				<dict>
  					<key>Class</key>
  					<string>Sources</string>
  				</dict>
  				<dict>
  					<key>Class</key>
  					<string>Frameworks</string>
  				</dict>
  				<dict>
  					<key>Class</key>
  					<string>CopyFiles</string>
  					<key>DstPath</key>
  					<string>include/${PRODUCT_NAME}</string>
  					<key>DstSubfolderSpec</key>
  					<integer>16</integer>
  				</dict>
  			</array>
  			<key>Frameworks</key>
  			<array>
  				<string>Foundation</string>
  			</array>
        <key>Dependencies</key>
        <array>
          <integer>1</integer>
        </array>
  		</dict>
END_IOS_TARGET
bundle_target = <<BUNDLE_TARGET
      <dict>
        <key>Name</key>
        <string>___PACKAGENAMEASIDENTIFIER____Resources</string>
      	<key>ProductType</key>
      	<string>com.apple.product-type.bundle</string>
      	<key>SharedSettings</key>
      	<dict>
      		<key>INSTALL_PATH</key>
      		<string>$(LOCAL_LIBRARY_DIR)/Bundles</string>
      		<key>WRAPPER_EXTENSION</key>
      		<string>bundle</string>
      		<key>COMBINE_HIDPI_IMAGES</key>
      		<string>YES</string>
          <key>SUPPORTED_PLATFORMS</key>
          <string>iphonesimulator iphoneos macosx</string>
          <key>VALID_ARCHS</key>
          <string>i386 x86_64 arm7 arm7s</string>
          <key>ARCHS</key>
          <string>$(ARCHS_STANDARD_64_BIT)</string>
          <key>PRODUCT_NAME</key>
          <string>$(TARGET_NAME)</string>
      	</dict>
        <key>Configurations</key> <!-- Target Configuration -->
          <dict>
            <key>Release</key>
            <dict></dict>
          </dict>
      	<key>BuildPhases</key>
      	<array>
      		<dict>
      			<key>Class</key>
      			<string>Sources</string>
      		</dict>
      		<dict>
      			<key>Class</key>
      			<string>Frameworks</string>
      		</dict>
      		<dict>
      			<key>Class</key>
      			<string>Resources</string>
      		</dict>
      	</array>
      </dict>
BUNDLE_TARGET
start_mac_target = <<START_MAC_TARGET
      <dict>
        <key>Name</key>
        <string>___PACKAGENAME____Mac</string>
        <key>ProductType</key>
        <string>com.apple.product-type.framework</string>
      	<key>Ancestors</key>
      	<array>
      		<string>com.apple.dt.unit.bundleBase</string>
      		<string>com.apple.dt.unit.macBase</string>
      		<string>com.apple.dt.unit.macReferenceCounting</string>
      	</array>
        <key>SharedSettings</key>
        <dict>
          <key>SDKROOT</key>
          <string>macosx</string>
          <key>WRAPPER_EXTENSION</key>
          <string>framework</string>
          <key>FRAMEWORK_VERSION</key>
          <string>A</string>
          <key>DYLIB_COMPATIBILITY_VERSION</key>
          <string>1</string>
          <key>DYLIB_CURRENT_VERSION</key>
          <string>1</string>
          <key>PRODUCT_NAME</key>
          <string>$(PROJECT_NAME)_Mac</string>
START_MAC_TARGET
#SHARED_FRAMEWORK_SETTINGS goes here as well
end_mac_target = <<END_MAC_TARGET
        </dict>
        <key>Dependencies</key>
        <array>
        </array>
  		</dict>
END_MAC_TARGET
aggregate_target = <<AGGREGATE_TARGET
  		<dict>
  			<key>Name</key>
  			<string>___PACKAGENAME____iOS</string>
  			<key>Ancestors</key>
  			<array>
  				<string>com.apple.dt.unit.base</string>
  				<string>com.apple.dt.unit.aggregate</string>
  			</array>
  			<key>ProductType</key>
  			<string>com.apple.product-type.framework</string>
        <key>Dependencies</key>
        <array>
          <integer>0</integer>
          <integer>1</integer>
        </array>
        <key>SharedSettings</key>
        <dict>
          <key>PRODUCT_NAME</key>
          <string>$(PROJECT_NAME)_iOS</string>
        </dict>
        <key>BuildPhases</key>
        <array>
          <dict>
            <key>Class</key>
            <string>ShellScript</string>
            <key>ShellPath</key>
            <string>/bin/sh</string>
            <key>Name</key>
            <string>Create folder structure</string>
            <key>ShellScript</key>
            <string>
#Create folder structure
FW_PRODUCT_NAME="${PRODUCT_NAME}"

set -e

FW_HEADER_DIRECTORY="${BUILT_PRODUCTS_DIR}/${FW_PRODUCT_NAME}.framework/Versions/${FRAMEWORK_VERSION}/Headers"
FW_RESOURCE_DIRECTORY="${BUILT_PRODUCTS_DIR}/${FW_PRODUCT_NAME}.framework/Versions/${FRAMEWORK_VERSION}/Resources"

mkdir -p ${FW_HEADER_DIRECTORY}
mkdir -p ${FW_RESOURCE_DIRECTORY}

# Link the "Current" version to "${FRAMEWORK_VERSION}"
/bin/ln -sfh ${FRAMEWORK_VERSION} "${BUILT_PRODUCTS_DIR}/${FW_PRODUCT_NAME}.framework/Versions/Current"
/bin/ln -sfh Versions/Current/Headers "${BUILT_PRODUCTS_DIR}/${FW_PRODUCT_NAME}.framework/Headers"
/bin/ln -sfh Versions/Current/Resources "${BUILT_PRODUCTS_DIR}/${FW_PRODUCT_NAME}.framework/Resources"
/bin/ln -sfh "Versions/Current/${FW_PRODUCT_NAME}" "${BUILT_PRODUCTS_DIR}/${FW_PRODUCT_NAME}.framework/${FW_PRODUCT_NAME}"

# Copy resources
FW_RES_BUNDLE_PATH="${BUILT_PRODUCTS_DIR}/${FW_PRODUCT_NAME}_Resources.bundle"
FW_RES_BUNDLE_CONTENTS_PATH="${FW_RES_BUNDLE_PATH}/Contents/Resources"

if [ -d ${FW_RES_BUNDLE_PATH} ]; then
  cp -R "${FW_RES_BUNDLE_CONTENTS_PATH}/" ${FW_RESOURCE_DIRECTORY}
fi
            </string>
          </dict>
        </array>
  		</dict>
AGGREGATE_TARGET
end_targets = <<END_TARGETS
  	</array>
END_TARGETS
footer = <<FOOTER
  </dict>
</plist>
FOOTER

allTheThings = [
  header,
  start_targets,
  start_ios_target,
  shared_framework_settings,
  end_ios_target,
  bundle_target,
  start_mac_target,
  shared_framework_settings,
  end_mac_target,
  aggregate_target,
  end_targets,
  footer
]

puts allTheThings