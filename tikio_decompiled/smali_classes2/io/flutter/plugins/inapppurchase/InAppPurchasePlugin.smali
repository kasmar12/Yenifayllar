.class public Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;
.super Ljava/lang/Object;
.source "InAppPurchasePlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;


# static fields
.field static final PROXY_PACKAGE_KEY:Ljava/lang/String; = "PROXY_PACKAGE"

.field static final PROXY_VALUE:Ljava/lang/String; = "io.flutter.plugins.inapppurchase"


# instance fields
.field private methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private setUpMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V
    .locals 4

    .line 61
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;

    invoke-direct {v0, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 62
    new-instance v1, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    new-instance v2, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;

    invoke-direct {v2}, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;-><init>()V

    const/4 v3, 0x0

    invoke-direct {v1, v3, p2, v0, v2}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;-><init>(Landroid/app/Activity;Landroid/content/Context;Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;Lio/flutter/plugins/inapppurchase/BillingClientFactory;)V

    iput-object v1, p0, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    .line 65
    invoke-static {p1, v1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->setUp(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    return-void
.end method

.method private teardownMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-static {p1, v0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->setUp(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    .line 70
    iput-object v0, p0, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    return-void
.end method


# virtual methods
.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 3

    .line 40
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "PROXY_PACKAGE"

    const-string v2, "io.flutter.plugins.inapppurchase"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->setActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 30
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->setUpMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V

    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 2

    .line 46
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->setActivity(Landroid/app/Activity;)V

    .line 47
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    invoke-virtual {v0}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->onDetachedFromActivity()V

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 2

    .line 57
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->setActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 35
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->teardownMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0

    .line 52
    invoke-virtual {p0, p1}, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V

    return-void
.end method

.method setMethodCallHandler(Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;)V
    .locals 0

    .line 75
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/InAppPurchasePlugin;->methodCallHandler:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    return-void
.end method
