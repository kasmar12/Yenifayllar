.class public Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;
.super Ljava/lang/Object;
.source "FlutterFirebaseFunctionsPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# static fields
.field private static final METHOD_CHANNEL_NAME:Ljava/lang/String; = "plugins.flutter.io/firebase_functions"


# instance fields
.field private channel:Lio/flutter/plugin/common/MethodChannel;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getExceptionDetails(Ljava/lang/Exception;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 140
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-nez p1, :cond_0

    return-object v0

    .line 147
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 150
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    instance-of v3, v3, Lcom/google/firebase/functions/FirebaseFunctionsException;

    if-eqz v3, :cond_4

    .line 152
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/functions/FirebaseFunctionsException;

    .line 153
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCode()Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v1

    .line 154
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 155
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getDetails()Ljava/lang/Object;

    move-result-object v3

    .line 157
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    instance-of v4, v4, Ljava/io/IOException;

    if-eqz v4, :cond_1

    .line 158
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Canceled"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 160
    sget-object p1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v1

    .line 161
    sget-object p1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 162
    :cond_1
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    instance-of v4, v4, Ljava/io/InterruptedIOException;

    if-eqz v4, :cond_2

    .line 164
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "timeout"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 165
    sget-object p1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v1

    .line 166
    sget-object p1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 167
    :cond_2
    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    instance-of p1, p1, Ljava/io/IOException;

    if-eqz p1, :cond_3

    .line 169
    sget-object p1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->UNAVAILABLE:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object v1

    .line 170
    sget-object p1, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->UNAVAILABLE:Lcom/google/firebase/functions/FirebaseFunctionsException$Code;

    invoke-virtual {p1}, Lcom/google/firebase/functions/FirebaseFunctionsException$Code;->name()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_3
    move-object p1, v2

    :goto_0
    move-object v2, v3

    goto :goto_1

    :cond_4
    const-string p1, "UNKNOWN"

    move-object v6, v1

    move-object v1, p1

    move-object p1, v6

    :goto_1
    const-string v3, "_"

    const-string v4, "-"

    .line 174
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, "code"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "message"

    .line 175
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v2, :cond_5

    const-string p1, "additionalData"

    .line 178
    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    return-object v0
.end method

.method private getFunctions(Ljava/util/Map;)Lcom/google/firebase/functions/FirebaseFunctions;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/firebase/functions/FirebaseFunctions;"
        }
    .end annotation

    const-string v0, "appName"

    .line 59
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, "region"

    .line 60
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    .line 61
    invoke-static {v0}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    .line 62
    invoke-static {v0, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object p1

    return-object p1
.end method

.method private httpsFunctionCall(Ljava/util/Map;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 66
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 68
    sget-object v1, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, p1, v0}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;Ljava/util/Map;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 114
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method static synthetic lambda$didReinitializeFirebaseCore$3(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    const/4 v0, 0x0

    .line 197
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$getPluginConstantsForFirebaseApp$2(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    const/4 v0, 0x0

    .line 188
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public didReinitializeFirebaseCore()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 195
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 197
    sget-object v1, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda1;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 199
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public getPluginConstantsForFirebaseApp(Lcom/google/firebase/FirebaseApp;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/FirebaseApp;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 186
    new-instance p1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 188
    sget-object v0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda2;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 190
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$httpsFunctionCall$0$io-flutter-plugins-firebase-functions-FlutterFirebaseFunctionsPlugin(Ljava/util/Map;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 7

    .line 72
    :try_start_0
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->getFunctions(Ljava/util/Map;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object v0

    const-string v1, "functionName"

    .line 74
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "functionUri"

    .line 75
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "origin"

    .line 76
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "timeout"

    .line 77
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    const-string v5, "limitedUseAppCheckToken"

    .line 79
    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    const-string v6, "parameters"

    .line 80
    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz v3, :cond_0

    .line 83
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 84
    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Landroid/net/Uri;->getPort()I

    move-result v3

    invoke-virtual {v0, v6, v3}, Lcom/google/firebase/functions/FirebaseFunctions;->useEmulator(Ljava/lang/String;I)V

    .line 88
    :cond_0
    new-instance v3, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;

    invoke-direct {v3}, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;-><init>()V

    .line 90
    invoke-virtual {v3, v5}, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;->setLimitedUseAppCheckTokens(Z)Lcom/google/firebase/functions/HttpsCallableOptions$Builder;

    move-result-object v3

    .line 91
    invoke-virtual {v3}, Lcom/google/firebase/functions/HttpsCallableOptions$Builder;->build()Lcom/google/firebase/functions/HttpsCallableOptions;

    move-result-object v3

    if-eqz v1, :cond_1

    .line 94
    invoke-virtual {v0, v1, v3}, Lcom/google/firebase/functions/FirebaseFunctions;->getHttpsCallable(Ljava/lang/String;Lcom/google/firebase/functions/HttpsCallableOptions;)Lcom/google/firebase/functions/HttpsCallableReference;

    move-result-object v0

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_3

    .line 96
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 97
    invoke-virtual {v0, v1, v3}, Lcom/google/firebase/functions/FirebaseFunctions;->getHttpsCallableFromUrl(Ljava/net/URL;Lcom/google/firebase/functions/HttpsCallableOptions;)Lcom/google/firebase/functions/HttpsCallableReference;

    move-result-object v0

    :goto_0
    if-eqz v4, :cond_2

    .line 103
    invoke-virtual {v4}, Ljava/lang/Integer;->longValue()J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/firebase/functions/HttpsCallableReference;->setTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 106
    :cond_2
    invoke-virtual {v0, p1}, Lcom/google/firebase/functions/HttpsCallableReference;->call(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/functions/HttpsCallableResult;

    .line 107
    invoke-virtual {p1}, Lcom/google/firebase/functions/HttpsCallableResult;->getData()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_1

    .line 99
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Either functionName or functionUri must be set"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 110
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method public synthetic lambda$onMethodCall$1$io-flutter-plugins-firebase-functions-FlutterFirebaseFunctionsPlugin(Lio/flutter/plugin/common/MethodChannel$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 127
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    .line 130
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 133
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 134
    :goto_0
    invoke-direct {p0, p2}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->getExceptionDetails(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p2

    const-string v1, "firebase_functions"

    .line 131
    invoke-interface {p1, v1, v0, p2}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 2

    .line 48
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    const-string v1, "plugins.flutter.io/firebase_functions"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 49
    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 54
    iget-object p1, p0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 55
    iput-object v0, p0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 119
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    const-string v1, "FirebaseFunctions#call"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    return-void

    .line 124
    :cond_0
    invoke-virtual {p1}, Lio/flutter/plugin/common/MethodCall;->arguments()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->httpsFunctionCall(Ljava/util/Map;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 125
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
