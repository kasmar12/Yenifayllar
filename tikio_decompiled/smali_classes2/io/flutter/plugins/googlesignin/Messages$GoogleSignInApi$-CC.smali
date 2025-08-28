.class public final synthetic Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;
.super Ljava/lang/Object;
.source "Messages.java"


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

    .line 464
    sget-object v0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;->INSTANCE:Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;

    return-object v0
.end method

.method public static synthetic lambda$setup$0(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 477
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 478
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 479
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/googlesignin/Messages$InitParams;

    .line 481
    :try_start_0
    invoke-interface {p0, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->init(Lio/flutter/plugins/googlesignin/Messages$InitParams;)V

    const/4 p0, 0x0

    .line 482
    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 484
    invoke-static {p0}, Lio/flutter/plugins/googlesignin/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object v0

    .line 487
    :goto_0
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$1(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 500
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 501
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$1;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$1;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 514
    invoke-interface {p0, v0}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->signInSilently(Lio/flutter/plugins/googlesignin/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$2(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 527
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 528
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$2;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$2;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 541
    invoke-interface {p0, v0}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->signIn(Lio/flutter/plugins/googlesignin/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$3(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 554
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 555
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 556
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x1

    .line 557
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    .line 558
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$3;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$3;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 571
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->getAccessToken(Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/googlesignin/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$4(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 584
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 585
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$4;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$4;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 598
    invoke-interface {p0, v0}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->signOut(Lio/flutter/plugins/googlesignin/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$5(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 611
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 612
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$5;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$5;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 625
    invoke-interface {p0, v0}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->disconnect(Lio/flutter/plugins/googlesignin/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$6(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 638
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 640
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->isSignedIn()Ljava/lang/Boolean;

    move-result-object p0

    const/4 v0, 0x0

    .line 641
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 643
    invoke-static {p0}, Lio/flutter/plugins/googlesignin/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 646
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$7(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 659
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 660
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 661
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 662
    new-instance v1, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$6;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$6;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 675
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->clearAuthCache(Ljava/lang/String;Lio/flutter/plugins/googlesignin/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$8(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 688
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 689
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 690
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 691
    new-instance v1, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$7;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$7;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 704
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;->requestScopes(Ljava/util/List;Lio/flutter/plugins/googlesignin/Messages$Result;)V

    return-void
.end method

.method public static setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V
    .locals 4

    .line 471
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 473
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    const-string v2, "dev.flutter.pigeon.GoogleSignInApi.init"

    invoke-direct {v0, p0, v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 475
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    .line 490
    :cond_0
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 494
    :goto_0
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 496
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.signInSilently"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_1

    .line 498
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda1;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_1

    .line 517
    :cond_1
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 521
    :goto_1
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 523
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.signIn"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_2

    .line 525
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_2

    .line 544
    :cond_2
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 548
    :goto_2
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 550
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.getAccessToken"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_3

    .line 552
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_3

    .line 574
    :cond_3
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 578
    :goto_3
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 580
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.signOut"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_4

    .line 582
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_4

    .line 601
    :cond_4
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 605
    :goto_4
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 607
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.disconnect"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_5

    .line 609
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda5;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_5

    .line 628
    :cond_5
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 632
    :goto_5
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 634
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.isSignedIn"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_6

    .line 636
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda6;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_6

    .line 649
    :cond_6
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 653
    :goto_6
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 655
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.clearAuthCache"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_7

    .line 657
    new-instance v2, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda7;

    invoke-direct {v2, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda7;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_7

    .line 678
    :cond_7
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 682
    :goto_7
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 684
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.GoogleSignInApi.requestScopes"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_8

    .line 686
    new-instance p0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda8;

    invoke-direct {p0, p1}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;)V

    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_8

    .line 707
    :cond_8
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_8
    return-void
.end method
