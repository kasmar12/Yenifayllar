.class public Lio/flutter/plugins/connectivity/ConnectivityPlugin;
.super Ljava/lang/Object;
.source "ConnectivityPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;


# instance fields
.field private eventChannel:Lio/flutter/plugin/common/EventChannel;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static registerWith(Lio/flutter/plugin/common/PluginRegistry$Registrar;)V
    .locals 2

    .line 24
    new-instance v0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;

    invoke-direct {v0}, Lio/flutter/plugins/connectivity/ConnectivityPlugin;-><init>()V

    .line 25
    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->messenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->context()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->setupChannels(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V

    return-void
.end method

.method private setupChannels(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V
    .locals 2

    .line 39
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    const-string v1, "plugins.flutter.io/connectivity"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 40
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    const-string v1, "plugins.flutter.io/connectivity_status"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    const-string p1, "connectivity"

    .line 42
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    .line 44
    new-instance v0, Lio/flutter/plugins/connectivity/Connectivity;

    invoke-direct {v0, p1}, Lio/flutter/plugins/connectivity/Connectivity;-><init>(Landroid/net/ConnectivityManager;)V

    .line 46
    new-instance p1, Lio/flutter/plugins/connectivity/ConnectivityMethodChannelHandler;

    invoke-direct {p1, v0}, Lio/flutter/plugins/connectivity/ConnectivityMethodChannelHandler;-><init>(Lio/flutter/plugins/connectivity/Connectivity;)V

    .line 48
    new-instance v1, Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;

    invoke-direct {v1, p2, v0}, Lio/flutter/plugins/connectivity/ConnectivityBroadcastReceiver;-><init>(Landroid/content/Context;Lio/flutter/plugins/connectivity/Connectivity;)V

    .line 51
    iget-object p2, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p2, p1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 52
    iget-object p1, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    invoke-virtual {p1, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    return-void
.end method

.method private teardownChannels()V
    .locals 2

    .line 56
    iget-object v0, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 57
    iget-object v0, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 58
    iput-object v1, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 59
    iput-object v1, p0, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    return-void
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 30
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->setupChannels(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lio/flutter/plugins/connectivity/ConnectivityPlugin;->teardownChannels()V

    return-void
.end method
