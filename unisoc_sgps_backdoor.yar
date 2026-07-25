rule Unisoc_Longcheer_SGPS_Backdoor {
    meta:
        author = "Alexis Michel De La Cruz Correa & AI Assistant"
        date = "2026-07-25"
        description = "Detecta el backdoor de sistema com.spreadtrum.sgps y sus interfaces HAL privilegiadas"
        severity = "critical"
        reference = "CVE-2026-XXXXX (Pending)"
        tags = "android, backdoor, supply-chain, unisoc, longcheer, sgps"

    strings:
        // 1. Identificadores de Paquete y Clase (Huella Digital)
        $pkg_name = "com.spreadtrum.sgps" ascii wide
        $cls_activity = "Lcom/spreadtrum/sgps/SgpsActivity;" ascii
        $cls_receiver = "Lcom/spreadtrum/sgps/SgpsTestBroadcastReceiver;" ascii
        $cls_service = "Lcom/spreadtrum/sgps/SgpsService;" ascii
        
        // 2. El Vector de Activación Oculta (Código Secreto 2266)
        $secret_code_action = "android.provider.Telephony.SECRET_CODE" ascii wide
        $secret_code_host = "android_secret_code://2266" ascii wide
        $broadcast_priority = "priority=\"1000\"" ascii
        
        // 3. Interfaces HAL Peligrosas (IToolControl / SocketUtils)
        $aidl_interface = "Lvendor/sprd/hardware/tool/IToolControl;" ascii
        $aidl_proxy = "IToolControl$Stub$Proxy" ascii
        $local_socket = "Landroid/net/LocalSocket;" ascii
        $send_cmd_method = "sendCmdAndRecResult" ascii
        $run_cmd_method = "runCmdForResult" ascii
        $write_dev_method = "writeSysDev" ascii
        
        // 4. Comandos y Permisos Críticos
        $perm_reboot = "android.permission.REBOOT" ascii wide
        $perm_bg_location = "android.permission.ACCESS_BACKGROUND_LOCATION" ascii wide
        $perm_extra_cmds = "android.permission.ACCESS_LOCATION_EXTRA_COMMANDS" ascii wide
        $wake_lock = "acquireScreenWakeLock" ascii
        
        // 5. Lógica de Exfiltración y Túnel
        $wg_interface = "wg0" ascii
        $sipc_daemon = "sprd_sipc" ascii
        $mailbox_dev = "/dev/unisoc_mailbox" ascii
        $nmea_log = "mFileNmea" ascii
        $auto_transfer = "startGPSAutoTransferTest" ascii
        
        // 6. Certificado Longcheer (Opcional, si se escanea el APK completo)
        $longcheer_cert = "Longcheer" ascii wide
        $shanghai_loc = "ShangHai" ascii wide

    condition:
        // Debe ser un APK (comienza con PK)
        uint32be(0) == 0x504B0304 and
        // Debe contener el paquete principal Y al menos 2 de los siguientes indicadores críticos:
        $pkg_name and (
            ($secret_code_action and $secret_code_host) or // Activación oculta
            ($aidl_interface and $run_cmd_method) or       // Ejecución de comandos
            ($perm_reboot and $perm_bg_location) or        // Permisos peligrosos
            ($mailbox_dev and $sipc_daemon) or             // Conexión Kernel
            ($auto_transfer and $nmea_log)                 // Exfiltración GPS
        )
}   
