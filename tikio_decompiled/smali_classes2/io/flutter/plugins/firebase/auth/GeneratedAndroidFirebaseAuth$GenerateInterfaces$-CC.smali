.class public final synthetic Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces$-CC;
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

    .line 4494
    sget-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfacesCodec;->INSTANCE:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfacesCodec;

    return-object v0
.end method

.method public static synthetic lambda$setup$0(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 4509
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4510
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 4511
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;

    .line 4513
    :try_start_0
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces;->pigeonInterface(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;)V

    const/4 p0, 0x0

    .line 4514
    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 4516
    invoke-static {p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object v0

    .line 4519
    :goto_0
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces;)V
    .locals 3

    .line 4501
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 4505
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    const-string v2, "dev.flutter.pigeon.firebase_auth_platform_interface.GenerateInterfaces.pigeonInterface"

    invoke-direct {v0, p0, v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_0

    .line 4507
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces$$ExternalSyntheticLambda0;

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$GenerateInterfaces;)V

    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 4522
    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_0
    return-void
.end method
