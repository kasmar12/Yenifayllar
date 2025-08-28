.class public Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;
.super Ljava/lang/Object;
.source "FlutterFirebaseAuthPluginException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static alreadyLinkedProvider()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;
    .locals 4

    .line 158
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v1, "PROVIDER_ALREADY_LINKED"

    const-string v2, "User has already been linked to the given provider."

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method static invalidCredential()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;
    .locals 4

    .line 146
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v1, "INVALID_CREDENTIAL"

    const-string v2, "The supplied auth credential is malformed, has expired or is not currently supported."

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method static noSuchProvider()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;
    .locals 4

    .line 153
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v1, "NO_SUCH_PROVIDER"

    const-string v2, "User was not linked to an account with the given provider."

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method static noUser()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;
    .locals 4

    .line 141
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v1, "NO_CURRENT_USER"

    const-string v2, "No user currently signed in."

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method static parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;
    .locals 6

    const-string v0, "UNKNOWN"

    const/4 v1, 0x0

    if-nez p0, :cond_0

    .line 32
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    invoke-direct {p0, v0, v1, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 37
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 39
    instance-of v4, p0, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;

    if-eqz v4, :cond_1

    .line 40
    check-cast p0, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 44
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;->getResolver()Lcom/google/firebase/auth/MultiFactorResolver;

    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorResolver;->getHints()Ljava/util/List;

    move-result-object v2

    .line 47
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorResolver;->getSession()Lcom/google/firebase/auth/MultiFactorSession;

    move-result-object v3

    .line 48
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    .line 49
    sget-object v5, Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;->multiFactorSessionMap:Ljava/util/Map;

    invoke-interface {v5, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    .line 52
    sget-object v5, Lio/flutter/plugins/firebase/auth/FlutterFirebaseMultiFactor;->multiFactorResolverMap:Ljava/util/Map;

    invoke-interface {v5, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    invoke-static {v2}, Lio/flutter/plugins/firebase/auth/PigeonParser;->multiFactorInfoToMap(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 58
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;->getResolver()Lcom/google/firebase/auth/MultiFactorResolver;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/auth/MultiFactorResolver;->getFirebaseAuth()Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/auth/FirebaseAuth;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v5, "appName"

    .line 56
    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "multiFactorHints"

    .line 60
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "multiFactorSessionId"

    .line 62
    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "multiFactorResolverId"

    .line 63
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    .line 66
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;->getErrorCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuthMultiFactorException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, v2, p0, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    .line 69
    :cond_1
    instance-of v4, p0, Ljava/util/concurrent/ExecutionException;

    if-eqz v4, :cond_2

    .line 70
    invoke-static {}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->noSuchProvider()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p0

    return-object p0

    .line 73
    :cond_2
    instance-of v4, p0, Lcom/google/firebase/FirebaseNetworkException;

    if-nez v4, :cond_e

    .line 74
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 75
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    instance-of v4, v4, Lcom/google/firebase/FirebaseNetworkException;

    if-eqz v4, :cond_3

    goto/16 :goto_2

    .line 82
    :cond_3
    instance-of v4, p0, Lcom/google/firebase/FirebaseApiNotAvailableException;

    if-nez v4, :cond_d

    .line 83
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 84
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    instance-of v4, v4, Lcom/google/firebase/FirebaseApiNotAvailableException;

    if-eqz v4, :cond_4

    goto/16 :goto_1

    .line 89
    :cond_4
    instance-of v4, p0, Lcom/google/firebase/FirebaseTooManyRequestsException;

    if-nez v4, :cond_c

    .line 90
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 91
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    instance-of v4, v4, Lcom/google/firebase/FirebaseTooManyRequestsException;

    if-eqz v4, :cond_5

    goto :goto_0

    .line 99
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 101
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Cannot create PhoneAuthCredential without either verificationProof"

    .line 102
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 103
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v0, "invalid-verification-code"

    const-string v2, "The verification ID used to create the phone auth credential is invalid."

    invoke-direct {p0, v0, v2, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0

    :cond_6
    if-eqz v2, :cond_7

    const-string v1, "User has already been linked to the given provider."

    .line 110
    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 111
    invoke-static {}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->alreadyLinkedProvider()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p0

    return-object p0

    .line 114
    :cond_7
    instance-of v1, p0, Lcom/google/firebase/auth/FirebaseAuthException;

    if-eqz v1, :cond_8

    .line 115
    move-object v0, p0

    check-cast v0, Lcom/google/firebase/auth/FirebaseAuthException;

    invoke-virtual {v0}, Lcom/google/firebase/auth/FirebaseAuthException;->getErrorCode()Ljava/lang/String;

    move-result-object v0

    .line 118
    :cond_8
    instance-of v1, p0, Lcom/google/firebase/auth/FirebaseAuthWeakPasswordException;

    if-eqz v1, :cond_9

    .line 119
    move-object v1, p0

    check-cast v1, Lcom/google/firebase/auth/FirebaseAuthWeakPasswordException;

    invoke-virtual {v1}, Lcom/google/firebase/auth/FirebaseAuthWeakPasswordException;->getReason()Ljava/lang/String;

    move-result-object v2

    .line 122
    :cond_9
    instance-of v1, p0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;

    if-eqz v1, :cond_b

    .line 123
    check-cast p0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;

    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->getEmail()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_a

    const-string v4, "email"

    .line 126
    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :cond_a
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->getUpdatedCredential()Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    if-eqz p0, :cond_b

    .line 133
    invoke-static {p0}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthCredential(Lcom/google/firebase/auth/AuthCredential;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential;

    move-result-object p0

    const-string v1, "authCredential"

    invoke-interface {v3, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    :cond_b
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    invoke-direct {p0, v0, v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0

    .line 92
    :cond_c
    :goto_0
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v0, "too-many-requests"

    const-string v2, "We have blocked all requests from this device due to unusual activity. Try again later."

    invoke-direct {p0, v0, v2, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0

    .line 85
    :cond_d
    :goto_1
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v0, "api-not-available"

    const-string v2, "The requested API is not available."

    invoke-direct {p0, v0, v2, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0

    .line 76
    :cond_e
    :goto_2
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    const-string v0, "network-request-failed"

    const-string v2, "A network error (such as timeout, interrupted connection or unreachable host) has occurred."

    invoke-direct {p0, v0, v2, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0
.end method
