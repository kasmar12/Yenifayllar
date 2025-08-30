.class public Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;
.super Ljava/lang/Object;
.source "FlutterUserAgentPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private channel:Lio/flutter/plugin/common/MethodChannel;

.field private constants:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private destroyWebView(Landroid/webkit/WebView;)V
    .locals 1

    const-string v0, "about:blank"

    .line 120
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 121
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 123
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearHistory()V

    .line 124
    invoke-virtual {p1}, Landroid/webkit/WebView;->removeAllViews()V

    .line 125
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroyDrawingCache()V

    .line 128
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V

    return-void
.end method

.method private getProperties()Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const-string v0, ""

    .line 59
    iget-object v1, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    if-eqz v1, :cond_0

    return-object v1

    .line 62
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    .line 64
    iget-object v1, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 65
    iget-object v2, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "."

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 70
    invoke-direct {p0}, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->getUserAgent()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    .line 74
    :try_start_0
    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 75
    iget-object v6, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    iget-object v7, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 76
    :try_start_1
    iget-object v0, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 77
    iget v5, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 78
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v7, 0x2f

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v7, 0x2e

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v7, 0x20

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    move-object v10, v1

    move-object v1, v0

    move-object v0, v6

    move v6, v5

    move-object v5, v10

    goto :goto_0

    :catch_1
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v6

    const/4 v6, 0x0

    goto :goto_0

    :catch_2
    move-exception v1

    move-object v5, v1

    const/4 v6, 0x0

    move-object v1, v0

    .line 81
    :goto_0
    invoke-virtual {v5}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    move v5, v6

    move-object v6, v0

    move-object v0, v1

    move-object v1, v4

    .line 84
    :goto_1
    iget-object v7, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    const-string v8, "systemName"

    const-string v9, "Android"

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    iget-object v7, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v9, "systemVersion"

    invoke-interface {v7, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    iget-object v7, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    const-string v8, "packageName"

    invoke-interface {v7, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    iget-object v2, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    const-string v7, "shortPackageName"

    invoke-interface {v2, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    iget-object v2, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    const-string v3, "applicationName"

    invoke-interface {v2, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    iget-object v2, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    const-string v3, "applicationVersion"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    iget-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "applicationBuildNumber"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    const-string v2, "packageUserAgent"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    iget-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    const-string v1, "userAgent"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    iget-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    invoke-direct {p0}, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->getWebViewUserAgent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "webViewUserAgent"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iget-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->constants:Ljava/util/Map;

    return-object v0
.end method

.method private getUserAgent()Ljava/lang/String;
    .locals 2

    .line 99
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    const-string v0, "http.agent"

    .line 100
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method private getWebViewUserAgent()Ljava/lang/String;
    .locals 2

    .line 107
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 108
    iget-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 111
    :cond_0
    new-instance v0, Landroid/webkit/WebView;

    iget-object v1, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 112
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v1

    .line 114
    invoke-direct {p0, v0}, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->destroyWebView(Landroid/webkit/WebView;)V

    return-object v1
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 3

    .line 35
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    const-string v2, "flutter_user_agent"

    invoke-direct {v0, v1, v2}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 36
    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 37
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 42
    iget-object p1, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 43
    iput-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 44
    iput-object v0, p0, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->applicationContext:Landroid/content/Context;

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 51
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    const-string v0, "getProperties"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 52
    invoke-direct {p0}, Lio/jojodev/flutter/flutteruseragent/FlutterUserAgentPlugin;->getProperties()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 54
    :cond_0
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_0
    return-void
.end method
