.class public Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;
.super Ljava/lang/Object;
.source "FlutterFirebaseMessagingBackgroundExecutor.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# static fields
.field private static final CALLBACK_HANDLE_KEY:Ljava/lang/String; = "callback_handle"

.field private static final TAG:Ljava/lang/String; = "FLTFireBGExecutor"

.field private static final USER_CALLBACK_HANDLE_KEY:Ljava/lang/String; = "user_callback_handle"


# instance fields
.field private backgroundChannel:Lio/flutter/plugin/common/MethodChannel;

.field private backgroundFlutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

.field private final isCallbackDispatcherReady:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->isCallbackDispatcherReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method static synthetic access$000(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;)J
    .locals 2

    .line 38
    invoke-direct {p0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->getUserCallbackHandle()J

    move-result-wide v0

    return-wide v0
.end method

.method private getPluginCallbackHandle()J
    .locals 4

    .line 290
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "io.flutter.firebase.messaging.callback"

    const/4 v2, 0x0

    .line 291
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "callback_handle"

    const-wide/16 v2, 0x0

    .line 292
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private getUserCallbackHandle()J
    .locals 4

    .line 271
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "io.flutter.firebase.messaging.callback"

    const/4 v2, 0x0

    .line 272
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "user_callback_handle"

    const-wide/16 v2, 0x0

    .line 273
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private initializeMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 2

    .line 302
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    const-string v1, "plugins.flutter.io/firebase_messaging_background"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->backgroundChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 304
    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method private onInitialized()V
    .locals 2

    .line 72
    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->isCallbackDispatcherReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 73
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->onInitialized()V

    return-void
.end method

.method public static setCallbackDispatcher(J)V
    .locals 3

    .line 57
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "io.flutter.firebase.messaging.callback"

    const/4 v2, 0x0

    .line 59
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 60
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "callback_handle"

    invoke-interface {v0, v1, p0, p1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static setUserCallbackHandle(J)V
    .locals 3

    .line 281
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "io.flutter.firebase.messaging.callback"

    const/4 v2, 0x0

    .line 283
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 284
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "user_callback_handle"

    invoke-interface {v0, v1, p0, p1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public executeDartCallbackInBackgroundIsolate(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V
    .locals 2

    .line 212
    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->backgroundFlutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    const-string v1, "FLTFireBGExecutor"

    if-nez v0, :cond_0

    const-string p1, "A background message could not be handled in Dart as no onBackgroundMessage handler has been registered."

    .line 213
    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    .line 221
    new-instance v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$1;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$1;-><init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;Ljava/util/concurrent/CountDownLatch;)V

    :cond_1
    const-string p2, "notification"

    .line 247
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/messaging/RemoteMessage;

    if-eqz p1, :cond_2

    .line 251
    invoke-static {p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingUtils;->remoteMessageToMap(Lcom/google/firebase/messaging/RemoteMessage;)Ljava/util/Map;

    move-result-object p1

    .line 252
    iget-object p2, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->backgroundChannel:Lio/flutter/plugin/common/MethodChannel;

    new-instance v1, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$2;

    invoke-direct {v1, p0, p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$2;-><init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;Ljava/util/Map;)V

    const-string p1, "MessagingBackground#onMessage"

    invoke-virtual {p2, p1, v1, v0}, Lio/flutter/plugin/common/MethodChannel;->invokeMethod(Ljava/lang/String;Ljava/lang/Object;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_0

    :cond_2
    const-string p1, "RemoteMessage instance not found in Intent."

    .line 262
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method isDartBackgroundHandlerRegistered()Z
    .locals 5

    .line 202
    invoke-direct {p0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->getPluginCallbackHandle()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNotRunning()Z
    .locals 1

    .line 68
    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->isCallbackDispatcherReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public synthetic lambda$startBackgroundIsolate$0$io-flutter-plugins-firebase-messaging-FlutterFirebaseMessagingBackgroundExecutor(Lio/flutter/embedding/engine/loader/FlutterLoader;Lio/flutter/embedding/engine/FlutterShellArgs;J)V
    .locals 4

    .line 159
    invoke-virtual {p1}, Lio/flutter/embedding/engine/loader/FlutterLoader;->findAppBundlePath()Ljava/lang/String;

    move-result-object p1

    .line 160
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 161
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->isNotRunning()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "FLTFireBGExecutor"

    if-eqz p2, :cond_0

    .line 163
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Creating background FlutterEngine instance, with args: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    invoke-virtual {p2}, Lio/flutter/embedding/engine/FlutterShellArgs;->toArray()[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 163
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    new-instance v2, Lio/flutter/embedding/engine/FlutterEngine;

    .line 169
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p2}, Lio/flutter/embedding/engine/FlutterShellArgs;->toArray()[Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, v3, p2}, Lio/flutter/embedding/engine/FlutterEngine;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    iput-object v2, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->backgroundFlutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    goto :goto_0

    :cond_0
    const-string p2, "Creating background FlutterEngine instance."

    .line 171
    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    new-instance p2, Lio/flutter/embedding/engine/FlutterEngine;

    .line 173
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p2, v2}, Lio/flutter/embedding/engine/FlutterEngine;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->backgroundFlutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 179
    :goto_0
    invoke-static {p3, p4}, Lio/flutter/view/FlutterCallbackInformation;->lookupCallbackInformation(J)Lio/flutter/view/FlutterCallbackInformation;

    move-result-object p2

    .line 180
    iget-object p3, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->backgroundFlutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {p3}, Lio/flutter/embedding/engine/FlutterEngine;->getDartExecutor()Lio/flutter/embedding/engine/dart/DartExecutor;

    move-result-object p3

    .line 181
    invoke-direct {p0, p3}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->initializeMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;)V

    if-nez p1, :cond_1

    const-string p1, "startBackgroundIsolate: \'appBundlePath\' was null, using alternative lookup method."

    .line 186
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    invoke-static {}, Lio/flutter/FlutterInjector;->instance()Lio/flutter/FlutterInjector;

    move-result-object p1

    invoke-virtual {p1}, Lio/flutter/FlutterInjector;->flutterLoader()Lio/flutter/embedding/engine/loader/FlutterLoader;

    move-result-object p1

    invoke-virtual {p1}, Lio/flutter/embedding/engine/loader/FlutterLoader;->findAppBundlePath()Ljava/lang/String;

    move-result-object p1

    .line 191
    :cond_1
    new-instance p4, Lio/flutter/embedding/engine/dart/DartExecutor$DartCallback;

    invoke-direct {p4, v0, p1, p2}, Lio/flutter/embedding/engine/dart/DartExecutor$DartCallback;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;Lio/flutter/view/FlutterCallbackInformation;)V

    .line 194
    invoke-virtual {p3, p4}, Lio/flutter/embedding/engine/dart/DartExecutor;->executeDartCallback(Lio/flutter/embedding/engine/dart/DartExecutor$DartCallback;)V

    :cond_2
    return-void
.end method

.method public synthetic lambda$startBackgroundIsolate$1$io-flutter-plugins-firebase-messaging-FlutterFirebaseMessagingBackgroundExecutor(Lio/flutter/embedding/engine/loader/FlutterLoader;Landroid/os/Handler;Lio/flutter/embedding/engine/FlutterShellArgs;J)V
    .locals 8

    .line 153
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/flutter/embedding/engine/loader/FlutterLoader;->startInitialization(Landroid/content/Context;)V

    .line 155
    invoke-static {}, Lio/flutter/plugins/firebase/messaging/ContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v7, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$$ExternalSyntheticLambda1;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p3

    move-wide v5, p4

    invoke-direct/range {v1 .. v6}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;Lio/flutter/embedding/engine/loader/FlutterLoader;Lio/flutter/embedding/engine/FlutterShellArgs;J)V

    const/4 p3, 0x0

    .line 154
    invoke-virtual {p1, v0, p3, p2, v7}, Lio/flutter/embedding/engine/loader/FlutterLoader;->ensureInitializationCompleteAsync(Landroid/content/Context;[Ljava/lang/String;Landroid/os/Handler;Ljava/lang/Runnable;)V

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 78
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    :try_start_0
    const-string v0, "MessagingBackground#initialized"

    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 85
    invoke-direct {p0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->onInitialized()V

    const/4 p1, 0x1

    .line 86
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 88
    :cond_0
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V
    :try_end_0
    .catch Lio/flutter/plugins/firebase/messaging/PluginRegistrantException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Flutter FCM error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/messaging/PluginRegistrantException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "error"

    invoke-interface {p2, v1, p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public startBackgroundIsolate()V
    .locals 5

    .line 116
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->isNotRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    invoke-direct {p0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->getPluginCallbackHandle()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v2, 0x0

    .line 119
    invoke-virtual {p0, v0, v1, v2}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->startBackgroundIsolate(JLio/flutter/embedding/engine/FlutterShellArgs;)V

    :cond_0
    return-void
.end method

.method public startBackgroundIsolate(JLio/flutter/embedding/engine/FlutterShellArgs;)V
    .locals 9

    .line 144
    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->backgroundFlutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-eqz v0, :cond_0

    const-string p1, "FLTFireBGExecutor"

    const-string p2, "Background isolate already started."

    .line 145
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 149
    :cond_0
    new-instance v2, Lio/flutter/embedding/engine/loader/FlutterLoader;

    invoke-direct {v2}, Lio/flutter/embedding/engine/loader/FlutterLoader;-><init>()V

    .line 150
    new-instance v7, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v7, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 151
    new-instance v8, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$$ExternalSyntheticLambda0;

    move-object v0, v8

    move-object v1, p0

    move-object v3, v7

    move-object v4, p3

    move-wide v5, p1

    invoke-direct/range {v0 .. v6}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;Lio/flutter/embedding/engine/loader/FlutterLoader;Landroid/os/Handler;Lio/flutter/embedding/engine/FlutterShellArgs;J)V

    .line 198
    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
