Pod::Spec.new do |mqttc|
	mqttc.name         = "MQTTClient"
	mqttc.version      = "0.15.3"
	mqttc.summary      = "iOS, macOS and tvOS native ObjectiveC MQTT Client Framework"
	mqttc.homepage     = "https://github.com/alimertozdemir/MQTTClient"
	mqttc.license      = { :type => "EPLv1", :file => "LICENSE" }
	mqttc.author       = { "Ali Mert Ozdemir" => "alimrtozdemir@gmail.com" }
	mqttc.source       = {
		:git => "https://github.com/alimertozdemir/MQTTClient.git",
		:submodules => true
	}

	mqttc.requires_arc = true
	mqttc.platform = :ios, "6.1", :osx, "10.10", :tvos, "9.0"
	mqttc.ios.deployment_target = "6.1"
	mqttc.osx.deployment_target = "10.10"
	mqttc.tvos.deployment_target = "9.0"
	mqttc.default_subspec = "Core"

	mqttc.subspec "Core" do |core|
		core.dependency "MQTTClient/Min"
		core.dependency "MQTTClient/Manager"
		core.dependency "MQTTClient/Proto"
	end

	mqttc.subspec "Min" do |min|
		min.source_files =	"MQTTClient/MQTTCFSocketDecoder.{h,m}",
					"MQTTClient/MQTTCFSocketEncoder.{h,m}",
					"MQTTClient/MQTTCFSocketTransport.{h,m}",
					"MQTTClient/MQTTCoreDataPersistence.{h,m}",
					"MQTTClient/MQTTDecoder.{h,m}",
					"MQTTClient/MQTTInMemoryPersistence.{h,m}",
					"MQTTClient/MQTTLog.{h,m}",
					"MQTTClient/MQTTStrict.{h,m}",
					"MQTTClient/MQTTClient.h",
					"MQTTClient/MQTTMessage.{h,m}",
					"MQTTClient/MQTTPersistence.h",
					"MQTTClient/MQTTSSLSecurityPolicy.{h,m}",
					"MQTTClient/MQTTSSLSecurityPolicyDecoder.{h,m}",
					"MQTTClient/MQTTSSLSecurityPolicyEncoder.{h,m}",
					"MQTTClient/MQTTSSLSecurityPolicyTransport.{h,m}",
					"MQTTClient/MQTTProperties.{h,m}",
					"MQTTClient/MQTTSession.{h,m}",
					"MQTTClient/MQTTSessionLegacy.{h,m}",
					"MQTTClient/MQTTSessionSynchron.{h,m}",
					"MQTTClient/MQTTTransport.{h,m}",
					"MQTTClient/GCDTimer.{h,m}"
	end

	mqttc.subspec "MinL" do |minl|
		minl.dependency "CocoaLumberjack"

		minl.source_files =	"MQTTClient/MQTTCFSocketDecoder.{h,m}",
					"MQTTClient/MQTTCFSocketEncoder.{h,m}",
					"MQTTClient/MQTTCFSocketTransport.{h,m}",
					"MQTTClient/MQTTCoreDataPersistence.{h,m}",
					"MQTTClient/MQTTDecoder.{h,m}",
					"MQTTClient/MQTTInMemoryPersistence.{h,m}",
					"MQTTClient/MQTTLog.{h,m}",
					"MQTTClient/MQTTStrict.{h,m}",
					"MQTTClient/MQTTClient.h",
					"MQTTClient/MQTTMessage.{h,m}",
					"MQTTClient/MQTTPersistence.h",
					"MQTTClient/MQTTSSLSecurityPolicy.{h,m}",
					"MQTTClient/MQTTSSLSecurityPolicyDecoder.{h,m}",
					"MQTTClient/MQTTSSLSecurityPolicyEncoder.{h,m}",
					"MQTTClient/MQTTSSLSecurityPolicyTransport.{h,m}",
					"MQTTClient/MQTTProperties.{h,m}",
					"MQTTClient/MQTTSession.{h,m}",
					"MQTTClient/MQTTSessionLegacy.{h,m}",
					"MQTTClient/MQTTSessionSynchron.{h,m}",
					"MQTTClient/MQTTTransport.{h,m}",
					"MQTTClient/GCDTimer.{h,m}"
		minl.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "LUMBERJACK=1" }
	end

	mqttc.subspec "Manager" do |manager|
		manager.source_files =	"MQTTClient/MQTTSessionManager.{h,m}",
					"MQTTClient/ReconnectTimer.{h,m}",
					"MQTTClient/ForegroundReconnection.{h,m}"
		manager.dependency "MQTTClient/Min"
	end

	mqttc.subspec "ManagerL" do |managerl|
		managerl.source_files =	"MQTTClient/MQTTSessionManager.{h,m}",
					"MQTTClient/ReconnectTimer.{h,m}",
					"MQTTClient/ForegroundReconnection.{h,m}"
		managerl.dependency "MQTTClient/MinL"
		managerl.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "LUMBERJACK=1" }
	end

	mqttc.subspec "Websocket" do |ws|
		ws.source_files = "MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		ws.dependency "SocketRocket"
		ws.dependency "MQTTClient/Min"
		ws.requires_arc = true
		ws.libraries = "icucore"
	end

	mqttc.subspec "WebsocketL" do |wsl|
		wsl.source_files = "MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		wsl.dependency "SocketRocket"
		wsl.dependency "MQTTClient/MinL"
		wsl.requires_arc = true
		wsl.libraries = "icucore"
		wsl.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "LUMBERJACK=1" }
	end

	mqttc.subspec "Proto" do |proto|
		proto.source_files =	"MQTTClient/**/*.{h,m}"
		proto.public_header_files = "MQTTClient/**/*.h"
		proto.dependency "Protobuf"
		proto.requires_arc = true
		proto.libraries = "icucore"
		proto.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1" }
	end

end
