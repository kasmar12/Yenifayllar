.class public final synthetic Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$-CC;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# direct methods
.method public static getCodec()Lio/flutter/plugin/common/MessageCodec;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/flutter/plugin/common/MessageCodec<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 4176
    sget-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApiCodec;->INSTANCE:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApiCodec;

    return-object v0
.end method

.method public static synthetic lambda$setup$0(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 4193
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4194
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 4195
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x1

    .line 4197
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonPhoneMultiFactorAssertion;

    const/4 v3, 0x2

    .line 4198
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 4199
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$1;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$1;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 4212
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi;->resolveSignIn(Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonPhoneMultiFactorAssertion;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi;)V
    .locals 3

    .line 4185
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 4189
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    const-string v2, "dev.flutter.pigeon.firebase_auth_platform_interface.MultiFactoResolverHostApi.resolveSignIn"

    invoke-direct {v0, p0, v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_0

    .line 4191
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$$ExternalSyntheticLambda0;

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$MultiFactoResolverHostApi;)V

    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 4215
    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_0
    return-void
.end method
