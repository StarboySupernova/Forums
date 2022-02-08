# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Forums' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Forums

  # Add the Firebase pod for Google Analytics
pod 'Firebase/Analytics'

# For Analytics without IDFA collection capability, use this pod instead
# pod ‘Firebase/AnalyticsWithoutAdIdSupport’

#pod 'Firebase/Firestore'

# Optionally, include the Swift extensions if you're using Swift.
pod 'FirebaseFirestoreSwift'

# Add the pods for any other Firebase products you want to use in your app
# For example, to use Firebase Authentication and Cloud Firestore
pod 'Firebase/Auth'
pod 'Firebase/Firestore'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
