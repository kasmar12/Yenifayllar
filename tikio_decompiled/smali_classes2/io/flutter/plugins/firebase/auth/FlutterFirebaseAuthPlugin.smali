.class public Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;
.super Ljava/lang/Object;
.source "FlutterFirebaseAuthPlugin.java"

# interfaces
.implements Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;
.implements Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final METHOD_CHANNEL_NAME:Ljava/lang/String; = "plugins.flutter.io/firebase_auth"

.field static final authCredentials:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/google/firebase/auth/AuthCredential;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private activity:Landroid/app/Activity;

.field private channel:Lio/flutter/plugin/common/MethodChannel;

.field private final firebaseAuthUser:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

.field private final firebaseMultiFactor:Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;

.field private final firebaseTotpMultiFactor:Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpMultiFactor;

.field private final firebaseTotpSecret:Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpSecret;

.field private messenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final streamHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lio/flutter/plugin/common/EventChannel;",
            "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->authCredentials:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->streamHandlers:Ljava/util/Map;

    .line 58
    new-instance v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseAuthUser:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

    .line 59
    new-instance v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseMultiFactor:Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;

    .line 61
    new-instance v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpMultiFactor;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpMultiFactor;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseTotpMultiFactor:Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpMultiFactor;

    .line 63
    new-instance v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpSecret;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpSecret;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseTotpSecret:Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpSecret;

    return-void
.end method

.method private getActivity()Landroid/app/Activity;
    .locals 1

    .line 128
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;
    .locals 2

    .line 133
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;->getAppName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    .line 134
    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object v0

    .line 135
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;->getTenantId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 136
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;->getTenantId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/FirebaseAuth;->setTenantId(Ljava/lang/String;)V

    .line 138
    :cond_0
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebaseCorePlugin;->customAuthDomain:Ljava/util/Map;

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;->getAppName()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_1

    .line 140
    invoke-virtual {v0, p0}, Lcom/google/firebase/auth/FirebaseAuth;->setCustomAuthDomain(Ljava/lang/String;)V

    :cond_1
    return-object v0
.end method

.method private initInstance(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 2

    const-string v0, "plugins.flutter.io/firebase_auth"

    .line 66
    invoke-static {v0, p0}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->registerPlugin(Ljava/lang/String;Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;)V

    .line 67
    new-instance v1, Lio/flutter/plugin/common/MethodChannel;

    invoke-direct {v1, p1, v0}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 68
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    .line 69
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseAuthUser:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthUserHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthUserHostApi;)V

    .line 70
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseMultiFactor:Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorUserHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorUserHostApi;)V

    .line 71
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseMultiFactor:Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi;)V

    .line 72
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseTotpMultiFactor:Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpMultiFactor;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpHostApi;)V

    .line 73
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseTotpSecret:Lio/flutter/plugins/firebase/auth/FlutterFirebaseTotpSecret;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpSecretHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpSecretHostApi;)V

    .line 75
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-void
.end method

.method static synthetic lambda$applyActionCode$0(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 205
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 206
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 210
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 209
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 208
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$checkActionCode$1(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 227
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 228
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/ActionCodeResult;

    .line 229
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseActionCodeResult(Lcom/google/firebase/auth/ActionCodeResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 233
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 232
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 231
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$confirmPasswordReset$2(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 250
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 251
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 255
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 254
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 253
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$createUserWithEmailAndPassword$3(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 274
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    .line 276
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 280
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 279
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 278
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$fetchSignInMethodsForEmail$10(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 462
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 463
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/SignInMethodQueryResult;

    .line 464
    invoke-interface {p1}, Lcom/google/firebase/auth/SignInMethodQueryResult;->getSignInMethods()Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 468
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 467
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 466
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$getPluginConstantsForFirebaseApp$16(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 3

    .line 672
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 673
    invoke-static {p0}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p0

    .line 674
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuth;->getCurrentUser()Lcom/google/firebase/auth/FirebaseUser;

    move-result-object v1

    .line 675
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuth;->getLanguageCode()Ljava/lang/String;

    move-result-object p0

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 678
    :cond_0
    invoke-static {v1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseFirebaseUser(Lcom/google/firebase/auth/FirebaseUser;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;

    move-result-object v1

    :goto_0
    if-eqz p0, :cond_1

    const-string v2, "APP_LANGUAGE_CODE"

    .line 681
    invoke-interface {v0, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    if-eqz v1, :cond_2

    .line 685
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->toList()Ljava/util/ArrayList;

    move-result-object p0

    const-string v1, "APP_CURRENT_USER"

    .line 686
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    :cond_2
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 691
    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method static synthetic lambda$sendPasswordResetEmail$11(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 486
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 487
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 491
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 490
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 489
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$sendPasswordResetEmail$12(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 501
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 502
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 506
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 505
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 504
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$sendSignInLinkToEmail$13(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 523
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 524
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 528
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 527
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 526
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$signInAnonymously$4(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 296
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 297
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    .line 298
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 302
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 301
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 300
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$signInWithCredential$5(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 324
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 325
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    .line 326
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 330
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 329
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 328
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$signInWithCustomToken$6(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 348
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 349
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    .line 350
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 354
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 353
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 352
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$signInWithEmailAndPassword$7(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 372
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 373
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 377
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 376
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 375
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$signInWithEmailLink$8(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 395
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 396
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    .line 397
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 401
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 400
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 399
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$signInWithProvider$9(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 427
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 428
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    .line 429
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 433
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 432
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 431
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$verifyPasswordResetCode$14(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 595
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 596
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 600
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 599
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    .line 598
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$verifyPhoneNumber$15(Lcom/google/firebase/auth/PhoneAuthCredential;)V
    .locals 2

    .line 644
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 645
    sget-object v1, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->authCredentials:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private removeEventListeners()V
    .locals 4

    .line 717
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/common/EventChannel;

    .line 718
    iget-object v2, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 720
    invoke-interface {v2, v3}, Lio/flutter/plugin/common/EventChannel$StreamHandler;->onCancel(Ljava/lang/Object;)V

    .line 722
    :cond_0
    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    goto :goto_0

    .line 724
    :cond_1
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method


# virtual methods
.method public applyActionCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 200
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 202
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->applyActionCode(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda0;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 203
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public checkActionCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo;",
            ">;)V"
        }
    .end annotation

    .line 222
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 224
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->checkActionCode(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda9;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda9;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 225
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public confirmPasswordReset(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 244
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 247
    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/auth/FirebaseAuth;->confirmPasswordReset(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda10;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda10;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 248
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public createUserWithEmailAndPassword(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;",
            ">;)V"
        }
    .end annotation

    .line 268
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 271
    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/auth/FirebaseAuth;->createUserWithEmailAndPassword(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda11;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda11;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 272
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

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

    .line 700
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 702
    sget-object v1, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0, v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 713
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public fetchSignInMethodsForEmail(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 456
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 459
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->fetchSignInMethodsForEmail(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda12;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda12;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 460
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public getPluginConstantsForFirebaseApp(Lcom/google/firebase/FirebaseApp;)Lcom/google/android/gms/tasks/Task;
    .locals 3
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

    .line 667
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 669
    sget-object v1, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda7;

    invoke-direct {v2, p1, v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda7;-><init>(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 695
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$didReinitializeFirebaseCore$17$io-flutter-plugins-firebase-auth-FlutterFirebaseAuthPlugin(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 705
    :try_start_0
    invoke-direct {p0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->removeEventListeners()V

    .line 706
    sget-object v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->authCredentials:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v0, 0x0

    .line 707
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 709
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    .line 103
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->activity:Landroid/app/Activity;

    .line 104
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseAuthUser:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;->setActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 80
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->initInstance(Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 2

    const/4 v0, 0x0

    .line 121
    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->activity:Landroid/app/Activity;

    .line 122
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseAuthUser:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

    invoke-virtual {v1, v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;->setActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 2

    const/4 v0, 0x0

    .line 109
    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->activity:Landroid/app/Activity;

    .line 110
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseAuthUser:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

    invoke-virtual {v1, v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;->setActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 85
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 88
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    .line 89
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthUserHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthUserHostApi;)V

    .line 90
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorUserHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorUserHostApi;)V

    .line 91
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi;)V

    .line 92
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpHostApi;)V

    .line 93
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpSecretHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactorTotpSecretHostApi;)V

    .line 95
    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 96
    iput-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 98
    invoke-direct {p0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->removeEventListeners()V

    return-void
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    .line 115
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->activity:Landroid/app/Activity;

    .line 116
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->firebaseAuthUser:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthUser;->setActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public registerAuthStateListener(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 168
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 169
    new-instance v0, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler;

    invoke-direct {v0, p1}, Lio/flutter/plugins/firebase/auth/AuthStateChannelStreamHandler;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "plugins.flutter.io/firebase_auth/auth-state/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 171
    new-instance v1, Lio/flutter/plugin/common/EventChannel;

    iget-object v2, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-direct {v1, v2, p1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 172
    invoke-virtual {v1, v0}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 173
    iget-object v2, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    invoke-interface {p2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 176
    invoke-interface {p2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public registerIdTokenListener(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 151
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 152
    new-instance v0, Lio/flutter/plugins/firebase/auth/IdTokenChannelStreamHandler;

    invoke-direct {v0, p1}, Lio/flutter/plugins/firebase/auth/IdTokenChannelStreamHandler;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "plugins.flutter.io/firebase_auth/id-token/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 154
    new-instance v1, Lio/flutter/plugin/common/EventChannel;

    iget-object v2, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-direct {v1, v2, p1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 155
    invoke-virtual {v1, v0}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 156
    iget-object v2, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    invoke-interface {p2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 159
    invoke-interface {p2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public revokeTokenWithAuthorizationCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public sendPasswordResetEmail(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 479
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    if-nez p3, :cond_0

    .line 483
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->sendPasswordResetEmail(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda13;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda13;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 484
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    .line 498
    :cond_0
    invoke-static {p3}, Lio/flutter/plugins/firebase/auth/PigeonParser;->getActionCodeSettings(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;)Lcom/google/firebase/auth/ActionCodeSettings;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/auth/FirebaseAuth;->sendPasswordResetEmail(Ljava/lang/String;Lcom/google/firebase/auth/ActionCodeSettings;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda14;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda14;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 499
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public sendSignInLinkToEmail(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 517
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 520
    invoke-static {p3}, Lio/flutter/plugins/firebase/auth/PigeonParser;->getActionCodeSettings(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;)Lcom/google/firebase/auth/ActionCodeSettings;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/auth/FirebaseAuth;->sendSignInLinkToEmail(Ljava/lang/String;Lcom/google/firebase/auth/ActionCodeSettings;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda15;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda15;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 521
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setLanguageCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 539
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    if-nez p2, :cond_0

    .line 542
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->useAppLanguage()V

    goto :goto_0

    .line 544
    :cond_0
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->setLanguageCode(Ljava/lang/String;)V

    .line 547
    :goto_0
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getLanguageCode()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 549
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method

.method public setSettings(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 559
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 562
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getFirebaseAuthSettings()Lcom/google/firebase/auth/FirebaseAuthSettings;

    move-result-object v0

    .line 563
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->getAppVerificationDisabledForTesting()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/FirebaseAuthSettings;->setAppVerificationDisabledForTesting(Z)V

    .line 565
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->getForceRecaptchaFlow()Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 567
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getFirebaseAuthSettings()Lcom/google/firebase/auth/FirebaseAuthSettings;

    move-result-object v0

    .line 568
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->getForceRecaptchaFlow()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/FirebaseAuthSettings;->forceRecaptchaFlowForTesting(Z)V

    .line 571
    :cond_0
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->getPhoneNumber()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->getSmsCode()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 573
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getFirebaseAuthSettings()Lcom/google/firebase/auth/FirebaseAuthSettings;

    move-result-object p1

    .line 575
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->getPhoneNumber()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->getSmsCode()Ljava/lang/String;

    move-result-object p2

    .line 574
    invoke-virtual {p1, v0, p2}, Lcom/google/firebase/auth/FirebaseAuthSettings;->setAutoRetrievedSmsCodeForPhoneNumber(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 p1, 0x0

    .line 578
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 580
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public signInAnonymously(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;",
            ">;)V"
        }
    .end annotation

    .line 291
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 293
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->signInAnonymously()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda16;

    invoke-direct {v0, p2}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda16;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 294
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public signInWithCredential(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/util/Map;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;",
            ">;)V"
        }
    .end annotation

    .line 314
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 315
    invoke-static {p2}, Lio/flutter/plugins/firebase/auth/PigeonParser;->getCredential(Ljava/util/Map;)Lcom/google/firebase/auth/AuthCredential;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 321
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->signInWithCredential(Lcom/google/firebase/auth/AuthCredential;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda17;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda17;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 322
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    .line 318
    :cond_0
    invoke-static {}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->invalidCredential()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p1

    throw p1
.end method

.method public signInWithCustomToken(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;",
            ">;)V"
        }
    .end annotation

    .line 342
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 345
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->signInWithCustomToken(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda1;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 346
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public signInWithEmailAndPassword(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;",
            ">;)V"
        }
    .end annotation

    .line 367
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 369
    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/auth/FirebaseAuth;->signInWithEmailAndPassword(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda2;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 370
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public signInWithEmailLink(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;",
            ">;)V"
        }
    .end annotation

    .line 390
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 392
    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/auth/FirebaseAuth;->signInWithEmailLink(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda3;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 393
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public signInWithProvider(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;",
            ">;)V"
        }
    .end annotation

    .line 413
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 415
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;->getProviderId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/auth/OAuthProvider;->newBuilder(Ljava/lang/String;)Lcom/google/firebase/auth/OAuthProvider$Builder;

    move-result-object v0

    .line 416
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;->getScopes()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 417
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;->getScopes()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/OAuthProvider$Builder;->setScopes(Ljava/util/List;)Lcom/google/firebase/auth/OAuthProvider$Builder;

    .line 419
    :cond_0
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;->getCustomParameters()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 420
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;->getCustomParameters()Ljava/util/Map;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/google/firebase/auth/OAuthProvider$Builder;->addCustomParameters(Ljava/util/Map;)Lcom/google/firebase/auth/OAuthProvider$Builder;

    .line 424
    :cond_1
    invoke-direct {p0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {v0}, Lcom/google/firebase/auth/OAuthProvider$Builder;->build()Lcom/google/firebase/auth/OAuthProvider;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/google/firebase/auth/FirebaseAuth;->startActivityForSignInWithProvider(Landroid/app/Activity;Lcom/google/firebase/auth/FederatedAuthProvider;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda4;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 425
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public signOut(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 443
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 444
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->signOut()V

    const/4 p1, 0x0

    .line 445
    invoke-interface {p2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 447
    invoke-interface {p2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public useEmulator(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 187
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 188
    invoke-virtual {p3}, Ljava/lang/Long;->intValue()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/auth/FirebaseAuth;->useEmulator(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 189
    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 191
    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public verifyPasswordResetCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 589
    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getAuthFromPigeon(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    .line 592
    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/FirebaseAuth;->verifyPasswordResetCode(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda5;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    .line 593
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public verifyPhoneNumber(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 611
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "plugins.flutter.io/firebase_auth/phone/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 612
    new-instance v1, Lio/flutter/plugin/common/EventChannel;

    iget-object v2, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-direct {v1, v2, v0}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 616
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;->getMultiFactorSessionId()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 617
    sget-object v2, Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;->multiFactorSessionMap:Ljava/util/Map;

    .line 618
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;->getMultiFactorSessionId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/auth/MultiFactorSession;

    move-object v6, v2

    goto :goto_0

    :cond_0
    move-object v6, v3

    .line 621
    :goto_0
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;->getMultiFactorInfoId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 625
    sget-object v4, Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;->multiFactorResolverMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 627
    sget-object v7, Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;->multiFactorResolverMap:Ljava/util/Map;

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/firebase/auth/MultiFactorResolver;

    invoke-virtual {v5}, Lcom/google/firebase/auth/MultiFactorResolver;->getHints()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/firebase/auth/MultiFactorInfo;

    .line 628
    invoke-virtual {v7}, Lcom/google/firebase/auth/MultiFactorInfo;->getUid()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    instance-of v8, v7, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    if-eqz v8, :cond_2

    .line 629
    move-object v3, v7

    check-cast v3, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    goto :goto_1

    :cond_3
    move-object v7, v3

    .line 636
    new-instance v9, Lio/flutter/plugins/firebase/auth/PhoneNumberVerificationStreamHandler;

    .line 638
    invoke-direct {p0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    sget-object v8, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;->INSTANCE:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;

    move-object v2, v9

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v2 .. v8}, Lio/flutter/plugins/firebase/auth/PhoneNumberVerificationStreamHandler;-><init>(Landroid/app/Activity;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;Lcom/google/firebase/auth/MultiFactorSession;Lcom/google/firebase/auth/PhoneMultiFactorInfo;Lio/flutter/plugins/firebase/auth/PhoneNumberVerificationStreamHandler$OnCredentialsListener;)V

    .line 648
    invoke-virtual {v1, v9}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 649
    iget-object p1, p0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {p1, v1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    invoke-interface {p3, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 653
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;->error(Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method
