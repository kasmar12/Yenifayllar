.class public final synthetic Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;
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

    .line 2620
    sget-object v0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApiCodec;->INSTANCE:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApiCodec;

    return-object v0
.end method

.method public static synthetic lambda$setUp$0(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 2635
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 2637
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->isReady()Ljava/lang/Boolean;

    move-result-object p0

    const/4 v0, 0x0

    .line 2638
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 2640
    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 2643
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setUp$1(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 2658
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2659
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2660
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    .line 2662
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, v2, p1

    .line 2663
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$1;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$1;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez v1, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 2677
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    .line 2676
    :goto_0
    invoke-interface {p0, p2, p1, v2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->startConnection(Ljava/lang/Long;Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$10(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2928
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2929
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2930
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2932
    :try_start_0
    invoke-interface {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->isFeatureSupported(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    .line 2933
    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 2935
    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object v0

    .line 2938
    :goto_0
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setUp$11(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 2953
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 2954
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$8;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$8;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2967
    invoke-interface {p0, v0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->isAlternativeBillingOnlyAvailableAsync(Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$12(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 2982
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 2983
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$9;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$9;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2996
    invoke-interface {p0, v0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->showAlternativeBillingOnlyInformationDialog(Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$13(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 3011
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 3012
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$10;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$10;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3026
    invoke-interface {p0, v0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->createAlternativeBillingOnlyReportingDetailsAsync(Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$2(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 2694
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 2696
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->endConnection()V

    const/4 p0, 0x0

    const/4 v0, 0x0

    .line 2697
    invoke-virtual {p1, p0, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 2699
    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 2702
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setUp$3(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 2717
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 2718
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$2;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$2;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2731
    invoke-interface {p0, v0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->getBillingConfigAsync(Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$4(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2746
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2747
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2748
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingFlowParams;

    .line 2750
    :try_start_0
    invoke-interface {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->launchBillingFlow(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingFlowParams;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    move-result-object p0

    .line 2751
    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 2753
    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object v0

    .line 2756
    :goto_0
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setUp$5(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2771
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2772
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2773
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2774
    new-instance v1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$3;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$3;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2787
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->acknowledgePurchase(Ljava/lang/String;Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$6(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2802
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2803
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2804
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2805
    new-instance v1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$4;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$4;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2818
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->consumeAsync(Ljava/lang/String;Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$7(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2833
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2834
    check-cast p1, Ljava/util/ArrayList;

    .line 2836
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, v1, p1

    .line 2837
    new-instance v1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$5;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$5;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2850
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->queryPurchasesAsync(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$8(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2865
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2866
    check-cast p1, Ljava/util/ArrayList;

    .line 2868
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, v1, p1

    .line 2869
    new-instance v1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$6;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$6;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2882
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->queryPurchaseHistoryAsync(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$9(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2897
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2898
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2899
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 2900
    new-instance v1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$7;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$7;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2913
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;->queryProductDetailsAsync(Ljava/util/List;Lio/flutter/plugins/inapppurchase/Messages$Result;)V

    return-void
.end method

.method public static setUp(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V
    .locals 4

    .line 2627
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2631
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    const-string v2, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.isReady"

    invoke-direct {v0, p0, v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 2633
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    .line 2646
    :cond_0
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2650
    :goto_0
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2654
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.startConnection"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_1

    .line 2656
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda5;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_1

    .line 2682
    :cond_1
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2686
    :goto_1
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2690
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.endConnection"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_2

    .line 2692
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda10;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda10;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_2

    .line 2705
    :cond_2
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2709
    :goto_2
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2713
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.getBillingConfigAsync"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_3

    .line 2715
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda11;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda11;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_3

    .line 2734
    :cond_3
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2738
    :goto_3
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2742
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.launchBillingFlow"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_4

    .line 2744
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda12;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda12;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_4

    .line 2759
    :cond_4
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2763
    :goto_4
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2767
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.acknowledgePurchase"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_5

    .line 2769
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda13;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda13;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_5

    .line 2790
    :cond_5
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2794
    :goto_5
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2798
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.consumeAsync"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_6

    .line 2800
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda1;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_6

    .line 2821
    :cond_6
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2825
    :goto_6
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2829
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.queryPurchasesAsync"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_7

    .line 2831
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_7

    .line 2853
    :cond_7
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2857
    :goto_7
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2861
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.queryPurchaseHistoryAsync"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_8

    .line 2863
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_8

    .line 2885
    :cond_8
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2889
    :goto_8
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2893
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.queryProductDetailsAsync"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_9

    .line 2895
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_9

    .line 2916
    :cond_9
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2920
    :goto_9
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2924
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.isFeatureSupported"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_a

    .line 2926
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda6;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_a

    .line 2941
    :cond_a
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2945
    :goto_a
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2949
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.isAlternativeBillingOnlyAvailableAsync"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_b

    .line 2951
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda7;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda7;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_b

    .line 2970
    :cond_b
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2974
    :goto_b
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2978
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.showAlternativeBillingOnlyInformationDialog"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_c

    .line 2980
    new-instance v2, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda8;

    invoke-direct {v2, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_c

    .line 2999
    :cond_c
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 3003
    :goto_c
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3007
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.createAlternativeBillingOnlyReportingDetailsAsync"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_d

    .line 3009
    new-instance p0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda9;

    invoke-direct {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi$$ExternalSyntheticLambda9;-><init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;)V

    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_d

    .line 3029
    :cond_d
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_d
    return-void
.end method
