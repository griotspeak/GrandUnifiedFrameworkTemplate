header = <<HEADER
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
HEADER
ancestors = <<ANCESTORS
	<key>Ancestors</key>
	<array>
		<string>com.apple.dt.unit.base</string>
    <string>com.apple.dt.unit.iOSReferenceCounting</string>
	</array>
ANCESTORS
is_concrete = <<IS_CONCRETE
	<key>Concrete</key>
	<true/>
IS_CONCRETE
definitions = <<DEFINITIONS
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
DEFINITIONS
description = <<DESC
<key>Description</key>
<string>This template builds a static library that links against the Foundation framework.</string>
DESC
identifier = <<IDENTIFIER
	<key>Identifier</key>
	<string>com.buttonsAndLights.cocoaTouchStaticLibrary</string>
IDENTIFIER
kind = <<KIND
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
KIND
start_project_section = <<START_PROJECT_SECTION
  <key>Project</key>
  <dict>
START_PROJECT_SECTION

project_settings = <<PROJECT_SETTINGS
  <key>SharedSettings</key>
  <dict>
  </dict>
PROJECT_SETTINGS
end_project_section = <<END_PROJECT_SECTION
  </dict>
END_PROJECT_SECTION

nodes = <<NODES
	<key>Nodes</key>
	<array>
		<string>___PACKAGENAME___-Prefix.pch:objC:importFoundation</string>
		<string>___PACKAGENAMEASIDENTIFIER___.h</string>
	</array>
NODES
options = <<OPTIONS
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
								<string>___PACKAGENAME___Tests</string>
							</dict>
						</array>
					</dict>
				</array>
			</dict>
		</dict>
	</array>
OPTIONS
start_targets = <<START_TARGETS
	<key>Targets</key>
	<array>
START_TARGETS
start_ios_target = <<START_IOS_TARGET
		<dict>
START_IOS_TARGET
ios_name = <<IOS_NAME    
			<key>Name</key>
			<string>___PACKAGENAME____iOS</string>
IOS_NAME
ios_ancestors = <<IOS_ANCESTORS
	<key>Ancestors</key>
	<array>
		<string>com.apple.dt.unit.base</string>
		<string>com.apple.dt.unit.iPhoneBase</string>
	</array>
IOS_ANCESTORS
shared_stuff_1 = <<SHARED_STUFF_1
			<key>SharedSettings</key>
			<dict>
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
        <key>PRODUCT_NAME</key>
        <string>$(TARGET_NAME)</string>
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
        <dict>
        <key>Class</key>
        <string>ShellScript</string>
        <key>ShellPath</key>
        <string>/bin/sh</string>
        <key>ShellScript</key>
        <string>
        set -e

        mkdir -p "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/Versions/A/Headers"
        mkdir -p "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/Versions/A/Resources"

        # Link the "Current" version to "A"
        /bin/ln -sfh A "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/Versions/Current"
        /bin/ln -sfh Versions/Current/Headers "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/Headers"
        /bin/ln -sfh Versions/Current/Resources "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/Resources"
        /bin/ln -sfh "Versions/Current/${PROJECT_NAME}" "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}"

        # The -a ensures that the headers maintain the source modification date so that we don't constantly
        # cause propagating rebuilds of files that import these headers.
        /bin/cp -a "${TARGET_BUILD_DIR}/${PUBLIC_HEADERS_FOLDER_PATH}/" "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/Versions/A/Headers"
        </string>
        </dict>
			</array>

			<key>Frameworks</key>
			<array>
				<string>Foundation</string>
			</array>
			<key>ProductType</key>
			<string>com.apple.product-type.library.static</string>
SHARED_STUFF_1
ios_dependencies = <<IOS_DEPENDENCIES
<key>Dependencies</key>
<array>
        <integer>1</integer>
        <integer>2</integer>
</array>
IOS_DEPENDENCIES
end_ios_target = <<END_IOS_TARGET
		</dict>
END_IOS_TARGET
start_mac_target = <<START_MAC_TARGET
		<dict>
START_MAC_TARGET
mac_name = <<MAC_NAME    
			<key>Name</key>
			<string>___PACKAGENAME____Mac</string>
MAC_NAME
mac_ancestors = <<MAC_ANCESTORS
			<key>Ancestors</key>
			<array>
				<string>com.apple.dt.unit.base</string>
				<string>com.apple.dt.unit.macBase</string>
				<string>com.apple.dt.unit.macReferenceCounting</string>
			</array>
MAC_ANCESTORS
#SHARED_STUFF_1 goes here as well
mac_dependencies = <<MAC_DEPENDENCIES
<key>Dependencies</key>
<array>
        <integer>0</integer>
        <integer>2</integer>
</array>
MAC_DEPENDENCIES
end_mac_target = <<END_MAC_TARGET
		</dict>
END_MAC_TARGET

start_aggregate_target = <<START_AGGREGATE_TARGET
		<dict>
START_AGGREGATE_TARGET
aggregate_name = <<AGGREGATE_NAME    
			<key>Name</key>
			<string>Framework</string>
AGGREGATE_NAME
aggregate_ancestors = <<AGGREGATE_ANCESTORS
			<key>Ancestors</key>
			<array>
				<string>com.apple.dt.unit.base</string>
				<string>com.apple.dt.unit.aggregate</string>
			</array>
      <key>BuildPhases</key>
      <array>
          <dict>
              <key>Class</key>
              <string>ShellScript</string>
              <key>ShellPath</key>
              <string>/bin/sh</string>
              <key>ShellScript</key>
              <string># Just a comment</string>
          </dict>
      </array>
AGGREGATE_ANCESTORS
end_aggregate_target = <<END_AGGREGATE_TARGET
		</dict>
END_AGGREGATE_TARGET

bundle_target = <<BUNDLE_TARGET
<dict>
  <key>Name</key>
  <string>___PACKAGENAMEASIDENTIFIER___Resources</string>
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
    <key>PRODUCT_NAME</key>
    <string>$(TARGET_NAME)</string>
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

end_targets = <<END_TARGETS
	</array>
END_TARGETS
footer = <<FOOTER
</dict>
</plist>
FOOTER

allTheThings = [
  header,
  ancestors,
  is_concrete,
  definitions,
  description,
  identifier,
  start_project_section,
  project_settings,
  end_project_section,
  kind,
  nodes,
  options,
  start_targets,
  start_ios_target,
  ios_name,
  ios_ancestors,
  shared_stuff_1,
  ios_dependencies,
  end_ios_target,
  start_mac_target,
  mac_name,
  mac_ancestors,
  shared_stuff_1,
  mac_dependencies,
  end_mac_target,
  bundle_target,
  start_aggregate_target,
  aggregate_name,
  aggregate_ancestors,
  end_aggregate_target,
  end_targets,
  footer]

puts allTheThings