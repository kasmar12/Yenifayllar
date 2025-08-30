.class public Lio/flutter/plugins/firebase/auth/PigeonParser;
.super Ljava/lang/Object;
.source "PigeonParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getActionCodeSettings(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;)Lcom/google/firebase/auth/ActionCodeSettings;
    .locals 4

    .line 236
    invoke-static {}, Lcom/google/firebase/auth/ActionCodeSettings;->newBuilder()Lcom/google/firebase/auth/ActionCodeSettings$Builder;

    move-result-object v0

    .line 238
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/ActionCodeSettings$Builder;->setUrl(Ljava/lang/String;)Lcom/google/firebase/auth/ActionCodeSettings$Builder;

    .line 240
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getDynamicLinkDomain()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 241
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getDynamicLinkDomain()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/ActionCodeSettings$Builder;->setDynamicLinkDomain(Ljava/lang/String;)Lcom/google/firebase/auth/ActionCodeSettings$Builder;

    .line 244
    :cond_0
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getHandleCodeInApp()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/auth/ActionCodeSettings$Builder;->setHandleCodeInApp(Z)Lcom/google/firebase/auth/ActionCodeSettings$Builder;

    .line 246
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getAndroidPackageName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 248
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getAndroidPackageName()Ljava/lang/String;

    move-result-object v1

    .line 249
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getAndroidInstallApp()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 250
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getAndroidMinimumVersion()Ljava/lang/String;

    move-result-object v3

    .line 247
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/firebase/auth/ActionCodeSettings$Builder;->setAndroidPackageName(Ljava/lang/String;ZLjava/lang/String;)Lcom/google/firebase/auth/ActionCodeSettings$Builder;

    .line 253
    :cond_1
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getIOSBundleId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 254
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;->getIOSBundleId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/firebase/auth/ActionCodeSettings$Builder;->setIOSBundleId(Ljava/lang/String;)Lcom/google/firebase/auth/ActionCodeSettings$Builder;

    .line 257
    :cond_2
    invoke-virtual {v0}, Lcom/google/firebase/auth/ActionCodeSettings$Builder;->build()Lcom/google/firebase/auth/ActionCodeSettings;

    move-result-object p0

    return-object p0
.end method

.method static getCredential(Ljava/util/Map;)Lcom/google/firebase/auth/AuthCredential;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/firebase/auth/AuthCredential;"
        }
    .end annotation

    const-string v0, "token"

    .line 172
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 173
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    .line 174
    sget-object v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->authCredentials:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/auth/AuthCredential;

    if-eqz p0, :cond_0

    return-object p0

    .line 177
    :cond_0
    invoke-static {}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPluginException;->invalidCredential()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FlutterError;

    move-result-object p0

    throw p0

    :cond_1
    const-string v0, "signInMethod"

    .line 184
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, "secret"

    .line 185
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "idToken"

    .line 186
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "accessToken"

    .line 187
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "rawNonce"

    .line 188
    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 190
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    const/4 v5, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v6

    const-string v7, "emailLink"

    sparse-switch v6, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x7

    goto :goto_0

    :sswitch_1
    const-string v6, "github.com"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v5, 0x6

    goto :goto_0

    :sswitch_2
    const-string v6, "password"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v5, 0x5

    goto :goto_0

    :sswitch_3
    const-string v6, "phone"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto :goto_0

    :cond_5
    const/4 v5, 0x4

    goto :goto_0

    :sswitch_4
    const-string v6, "oauth"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_0

    :cond_6
    const/4 v5, 0x3

    goto :goto_0

    :sswitch_5
    const-string v6, "facebook.com"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_0

    :cond_7
    const/4 v5, 0x2

    goto :goto_0

    :sswitch_6
    const-string v6, "google.com"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto :goto_0

    :cond_8
    const/4 v5, 0x1

    goto :goto_0

    :sswitch_7
    const-string v6, "twitter.com"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_0

    :cond_9
    const/4 v5, 0x0

    :goto_0
    const-string v0, "email"

    packed-switch v5, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 197
    :pswitch_0
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 198
    invoke-interface {p0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    .line 196
    invoke-static {v0, p0}, Lcom/google/firebase/auth/EmailAuthProvider;->getCredentialWithLink(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    return-object p0

    .line 207
    :pswitch_1
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object p0, v3

    check-cast p0, Ljava/lang/String;

    invoke-static {v3}, Lcom/google/firebase/auth/GithubAuthProvider;->getCredential(Ljava/lang/String;)Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    return-object p0

    .line 193
    :pswitch_2
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    .line 194
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    .line 192
    invoke-static {p0, v1}, Lcom/google/firebase/auth/EmailAuthProvider;->getCredential(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    return-object p0

    :pswitch_3
    const-string v0, "verificationId"

    .line 211
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, "smsCode"

    .line 212
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    .line 213
    invoke-static {v0, p0}, Lcom/google/firebase/auth/PhoneAuthProvider;->getCredential(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/auth/PhoneAuthCredential;

    move-result-object p0

    return-object p0

    :pswitch_4
    const-string v0, "providerId"

    .line 218
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    .line 219
    invoke-static {p0}, Lcom/google/firebase/auth/OAuthProvider;->newCredentialBuilder(Ljava/lang/String;)Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;

    move-result-object p0

    .line 220
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;->setAccessToken(Ljava/lang/String;)Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;

    if-nez v4, :cond_a

    .line 222
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;->setIdToken(Ljava/lang/String;)Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;

    goto :goto_1

    .line 224
    :cond_a
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v2, v4}, Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;->setIdTokenWithRawNonce(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;

    .line 227
    :goto_1
    invoke-virtual {p0}, Lcom/google/firebase/auth/OAuthProvider$CredentialBuilder;->build()Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    return-object p0

    .line 200
    :pswitch_5
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object p0, v3

    check-cast p0, Ljava/lang/String;

    invoke-static {v3}, Lcom/google/firebase/auth/FacebookAuthProvider;->getCredential(Ljava/lang/String;)Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    return-object p0

    .line 202
    :pswitch_6
    invoke-static {v2, v3}, Lcom/google/firebase/auth/GoogleAuthProvider;->getCredential(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    return-object p0

    .line 205
    :pswitch_7
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object p0, v3

    check-cast p0, Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object p0, v1

    check-cast p0, Ljava/lang/String;

    .line 204
    invoke-static {v3, v1}, Lcom/google/firebase/auth/TwitterAuthProvider;->getCredential(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/auth/AuthCredential;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x6d185c7a -> :sswitch_7
        -0x5b91fbb4 -> :sswitch_6
        -0x15becda7 -> :sswitch_5
        0x64a0e97 -> :sswitch_4
        0x65b3d6e -> :sswitch_3
        0x4889ba9b -> :sswitch_2
        0x7650dcf6 -> :sswitch_1
        0x7e5f41b6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static multiFactorInfoToMap(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/auth/MultiFactorInfo;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 288
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 289
    invoke-static {p0}, Lio/flutter/plugins/firebase/auth/PigeonParser;->multiFactorInfoToPigeon(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;

    .line 290
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->toList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static multiFactorInfoToPigeon(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/auth/MultiFactorInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;",
            ">;"
        }
    .end annotation

    .line 262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 263
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/auth/MultiFactorInfo;

    .line 264
    instance-of v2, v1, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    if-eqz v2, :cond_0

    .line 265
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    invoke-direct {v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;-><init>()V

    move-object v3, v1

    check-cast v3, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    .line 267
    invoke-virtual {v3}, Lcom/google/firebase/auth/PhoneMultiFactorInfo;->getPhoneNumber()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setPhoneNumber(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v2

    .line 268
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setDisplayName(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v2

    .line 269
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getEnrollmentTimestamp()J

    move-result-wide v3

    long-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setEnrollmentTimestamp(Ljava/lang/Double;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v2

    .line 270
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setUid(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v2

    .line 271
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getFactorId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setFactorId(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v1

    .line 272
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;

    move-result-object v1

    .line 265
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 275
    :cond_0
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    invoke-direct {v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;-><init>()V

    .line 277
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setDisplayName(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v2

    .line 278
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getEnrollmentTimestamp()J

    move-result-wide v3

    long-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setEnrollmentTimestamp(Ljava/lang/Double;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v2

    .line 279
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setUid(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v2

    .line 280
    invoke-virtual {v1}, Lcom/google/firebase/auth/MultiFactorInfo;->getFactorId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->setFactorId(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;

    move-result-object v1

    .line 281
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;

    move-result-object v1

    .line 275
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static parseActionCodeResult(Lcom/google/firebase/auth/ActionCodeResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo;
    .locals 7

    .line 297
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;-><init>()V

    .line 299
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;

    invoke-direct {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;-><init>()V

    .line 302
    invoke-interface {p0}, Lcom/google/firebase/auth/ActionCodeResult;->getOperation()I

    move-result v2

    const/4 v3, 0x5

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_5

    if-eq v2, v5, :cond_4

    if-eq v2, v4, :cond_3

    const/4 v6, 0x4

    if-eq v2, v6, :cond_2

    if-eq v2, v3, :cond_1

    const/4 v6, 0x6

    if-eq v2, v6, :cond_0

    goto :goto_0

    .line 322
    :cond_0
    sget-object v6, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->REVERT_SECOND_FACTOR_ADDITION:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-virtual {v0, v6}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->setOperation(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    goto :goto_0

    .line 318
    :cond_1
    sget-object v6, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->VERIFY_AND_CHANGE_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-virtual {v0, v6}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->setOperation(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    goto :goto_0

    .line 315
    :cond_2
    sget-object v6, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->EMAIL_SIGN_IN:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-virtual {v0, v6}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->setOperation(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    goto :goto_0

    .line 312
    :cond_3
    sget-object v6, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->RECOVER_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-virtual {v0, v6}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->setOperation(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    goto :goto_0

    .line 309
    :cond_4
    sget-object v6, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->VERIFY_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-virtual {v0, v6}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->setOperation(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    goto :goto_0

    .line 306
    :cond_5
    sget-object v6, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->PASSWORD_RESET:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-virtual {v0, v6}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->setOperation(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    .line 327
    :goto_0
    invoke-interface {p0}, Lcom/google/firebase/auth/ActionCodeResult;->getInfo()Lcom/google/firebase/auth/ActionCodeInfo;

    move-result-object p0

    if-eqz p0, :cond_6

    if-eq v2, v5, :cond_7

    :cond_6
    if-nez v2, :cond_8

    .line 331
    :cond_7
    invoke-virtual {p0}, Lcom/google/firebase/auth/ActionCodeInfo;->getEmail()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;->setEmail(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;

    goto :goto_1

    :cond_8
    if-eq v2, v4, :cond_9

    if-ne v2, v3, :cond_a

    .line 335
    :cond_9
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lcom/google/firebase/auth/ActionCodeEmailInfo;

    .line 336
    invoke-virtual {p0}, Lcom/google/firebase/auth/ActionCodeEmailInfo;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;->setEmail(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;

    .line 337
    invoke-virtual {p0}, Lcom/google/firebase/auth/ActionCodeEmailInfo;->getPreviousEmail()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;->setPreviousEmail(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;

    .line 340
    :cond_a
    :goto_1
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->setData(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfoData;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;

    .line 342
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeInfo;

    move-result-object p0

    return-object p0
.end method

.method private static parseAdditionalUserInfo(Lcom/google/firebase/auth/AdditionalUserInfo;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 58
    :cond_0
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;-><init>()V

    .line 61
    invoke-interface {p0}, Lcom/google/firebase/auth/AdditionalUserInfo;->isNewUser()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;->setIsNewUser(Ljava/lang/Boolean;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;

    .line 62
    invoke-interface {p0}, Lcom/google/firebase/auth/AdditionalUserInfo;->getProfile()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;->setProfile(Ljava/util/Map;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;

    .line 63
    invoke-interface {p0}, Lcom/google/firebase/auth/AdditionalUserInfo;->getProviderId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;->setProviderId(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;

    .line 64
    invoke-interface {p0}, Lcom/google/firebase/auth/AdditionalUserInfo;->getUsername()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;->setUsername(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;

    .line 66
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo;

    move-result-object p0

    return-object p0
.end method

.method static parseAuthCredential(Lcom/google/firebase/auth/AuthCredential;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential;
    .locals 4

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 75
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 76
    sget-object v1, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->authCredentials:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;

    invoke-direct {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;-><init>()V

    .line 81
    invoke-virtual {p0}, Lcom/google/firebase/auth/AuthCredential;->getProvider()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;->setProviderId(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;

    .line 82
    invoke-virtual {p0}, Lcom/google/firebase/auth/AuthCredential;->getSignInMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;->setSignInMethod(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;

    int-to-long v2, v0

    .line 83
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v1, v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;->setNativeId(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;

    .line 84
    instance-of v0, p0, Lcom/google/firebase/auth/OAuthCredential;

    if-eqz v0, :cond_1

    .line 85
    check-cast p0, Lcom/google/firebase/auth/OAuthCredential;

    invoke-virtual {p0}, Lcom/google/firebase/auth/OAuthCredential;->getAccessToken()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;->setAccessToken(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;

    .line 88
    :cond_1
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential;

    move-result-object p0

    return-object p0
.end method

.method static parseAuthResult(Lcom/google/firebase/auth/AuthResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;
    .locals 2

    .line 42
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;-><init>()V

    .line 45
    invoke-interface {p0}, Lcom/google/firebase/auth/AuthResult;->getAdditionalUserInfo()Lcom/google/firebase/auth/AdditionalUserInfo;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAdditionalUserInfo(Lcom/google/firebase/auth/AdditionalUserInfo;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;->setAdditionalUserInfo(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAdditionalUserInfo;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;

    .line 46
    invoke-interface {p0}, Lcom/google/firebase/auth/AuthResult;->getCredential()Lcom/google/firebase/auth/AuthCredential;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseAuthCredential(Lcom/google/firebase/auth/AuthCredential;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;->setCredential(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonAuthCredential;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;

    .line 47
    invoke-interface {p0}, Lcom/google/firebase/auth/AuthResult;->getUser()Lcom/google/firebase/auth/FirebaseUser;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseFirebaseUser(Lcom/google/firebase/auth/FirebaseUser;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;->setUser(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;

    .line 49
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserCredential;

    move-result-object p0

    return-object p0
.end method

.method static parseFirebaseUser(Lcom/google/firebase/auth/FirebaseUser;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;
    .locals 4

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 97
    :cond_0
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;-><init>()V

    .line 100
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    invoke-direct {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;-><init>()V

    .line 103
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setDisplayName(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 104
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setEmail(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 105
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->isEmailVerified()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setIsEmailVerified(Ljava/lang/Boolean;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 106
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->isAnonymous()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setIsAnonymous(Ljava/lang/Boolean;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 108
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getMetadata()Lcom/google/firebase/auth/FirebaseUserMetadata;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 110
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getMetadata()Lcom/google/firebase/auth/FirebaseUserMetadata;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/firebase/auth/FirebaseUserMetadata;->getCreationTimestamp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setCreationTimestamp(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 111
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getMetadata()Lcom/google/firebase/auth/FirebaseUserMetadata;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/firebase/auth/FirebaseUserMetadata;->getLastSignInTimestamp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setLastSignInTimestamp(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 113
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getPhoneNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setPhoneNumber(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 114
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getPhotoUrl()Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parsePhotoUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setPhotoUrl(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 115
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getUid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setUid(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 116
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getTenantId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->setTenantId(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;

    .line 118
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;->setUserInfo(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;

    .line 119
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseUser;->getProviderData()Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseUserInfoList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;->setProviderData(Ljava/util/List;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;

    .line 121
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;

    move-result-object p0

    return-object p0
.end method

.method private static parsePhotoUrl(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 163
    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, ""

    .line 166
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, p0

    :goto_0
    return-object v0
.end method

.method static parseTokenResult(Lcom/google/firebase/auth/GetTokenResult;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult;
    .locals 5

    .line 347
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;-><init>()V

    .line 350
    invoke-virtual {p0}, Lcom/google/firebase/auth/GetTokenResult;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->setToken(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    .line 351
    invoke-virtual {p0}, Lcom/google/firebase/auth/GetTokenResult;->getSignInProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->setSignInProvider(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    .line 352
    invoke-virtual {p0}, Lcom/google/firebase/auth/GetTokenResult;->getAuthTimestamp()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    mul-long v1, v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->setAuthTimestamp(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    .line 353
    invoke-virtual {p0}, Lcom/google/firebase/auth/GetTokenResult;->getExpirationTimestamp()J

    move-result-wide v1

    mul-long v1, v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->setExpirationTimestamp(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    .line 354
    invoke-virtual {p0}, Lcom/google/firebase/auth/GetTokenResult;->getIssuedAtTimestamp()J

    move-result-wide v1

    mul-long v1, v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->setIssuedAtTimestamp(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    .line 355
    invoke-virtual {p0}, Lcom/google/firebase/auth/GetTokenResult;->getClaims()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->setClaims(Ljava/util/Map;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    .line 356
    invoke-virtual {p0}, Lcom/google/firebase/auth/GetTokenResult;->getSignInSecondFactor()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->setSignInSecondFactor(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;

    .line 358
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult$Builder;->build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonIdTokenResult;

    move-result-object p0

    return-object p0
.end method

.method private static parseUserInfoList(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/google/firebase/auth/UserInfo;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 132
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/auth/UserInfo;

    if-nez v1, :cond_2

    goto :goto_0

    .line 136
    :cond_2
    invoke-interface {v1}, Lcom/google/firebase/auth/UserInfo;->getProviderId()Ljava/lang/String;

    move-result-object v2

    const-string v3, "firebase"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 137
    invoke-static {v1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parseUserInfoToMap(Lcom/google/firebase/auth/UserInfo;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private static parseUserInfoToMap(Lcom/google/firebase/auth/UserInfo;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/auth/UserInfo;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 145
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 146
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "displayName"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->getEmail()Ljava/lang/String;

    move-result-object v1

    const-string v2, "email"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->isEmailVerified()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "isEmailVerified"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->getPhoneNumber()Ljava/lang/String;

    move-result-object v1

    const-string v2, "phoneNumber"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->getPhotoUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/firebase/auth/PigeonParser;->parsePhotoUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "photoUrl"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->getUid()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->getUid()Ljava/lang/String;

    move-result-object v1

    :goto_0
    const-string v2, "uid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    invoke-interface {p0}, Lcom/google/firebase/auth/UserInfo;->getProviderId()Ljava/lang/String;

    move-result-object p0

    const-string v1, "providerId"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 154
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    const-string v1, "isAnonymous"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
