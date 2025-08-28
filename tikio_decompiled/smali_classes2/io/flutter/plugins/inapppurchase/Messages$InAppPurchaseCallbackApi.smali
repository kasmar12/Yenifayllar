.class public Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InAppPurchaseCallbackApi"
.end annotation


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 0

    .line 3091
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3092
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-void
.end method

.method static getCodec()Lio/flutter/plugin/common/MessageCodec;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/flutter/plugin/common/MessageCodec<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 3098
    sget-object v0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApiCodec;->INSTANCE:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApiCodec;

    return-object v0
.end method

.method static synthetic lambda$onBillingServiceDisconnected$0(Lio/flutter/plugins/inapppurchase/Messages$VoidResult;Ljava/lang/Object;)V
    .locals 4

    .line 3110
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 3111
    check-cast p1, Ljava/util/List;

    .line 3112
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 3113
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    const/4 v2, 0x0

    .line 3115
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3116
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v3, 0x2

    .line 3117
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {v0, v2, v1, p1}, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3113
    invoke-interface {p0, v0}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 3119
    :cond_0
    invoke-interface {p0}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->success()V

    goto :goto_0

    :cond_1
    const-string p1, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseCallbackApi.onBillingServiceDisconnected"

    .line 3122
    invoke-static {p1}, Lio/flutter/plugins/inapppurchase/Messages;->createConnectionError(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$onPurchasesUpdated$1(Lio/flutter/plugins/inapppurchase/Messages$VoidResult;Ljava/lang/Object;)V
    .locals 4

    .line 3136
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 3137
    check-cast p1, Ljava/util/List;

    .line 3138
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 3139
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    const/4 v2, 0x0

    .line 3141
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3142
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v3, 0x2

    .line 3143
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {v0, v2, v1, p1}, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3139
    invoke-interface {p0, v0}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 3145
    :cond_0
    invoke-interface {p0}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->success()V

    goto :goto_0

    :cond_1
    const-string p1, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseCallbackApi.onPurchasesUpdated"

    .line 3148
    invoke-static {p1}, Lio/flutter/plugins/inapppurchase/Messages;->createConnectionError(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$userSelectedalternativeBilling$2(Lio/flutter/plugins/inapppurchase/Messages$VoidResult;Ljava/lang/Object;)V
    .locals 4

    .line 3162
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 3163
    check-cast p1, Ljava/util/List;

    .line 3164
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 3165
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    const/4 v2, 0x0

    .line 3167
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3168
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v3, 0x2

    .line 3169
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {v0, v2, v1, p1}, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3165
    invoke-interface {p0, v0}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 3171
    :cond_0
    invoke-interface {p0}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->success()V

    goto :goto_0

    :cond_1
    const-string p1, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseCallbackApi.userSelectedalternativeBilling"

    .line 3174
    invoke-static {p1}, Lio/flutter/plugins/inapppurchase/Messages;->createConnectionError(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$VoidResult;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onBillingServiceDisconnected(Ljava/lang/Long;Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V
    .locals 4

    .line 3105
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 3106
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseCallbackApi.onBillingServiceDisconnected"

    invoke-direct {v0, v1, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    .line 3107
    new-instance v1, Ljava/util/ArrayList;

    .line 3108
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance p1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi$$ExternalSyntheticLambda0;

    invoke-direct {p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V

    .line 3107
    invoke-virtual {v0, v1, p1}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    return-void
.end method

.method public onPurchasesUpdated(Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V
    .locals 4

    .line 3131
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 3132
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseCallbackApi.onPurchasesUpdated"

    invoke-direct {v0, v1, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    .line 3133
    new-instance v1, Ljava/util/ArrayList;

    .line 3134
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance p1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi$$ExternalSyntheticLambda1;

    invoke-direct {p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V

    .line 3133
    invoke-virtual {v0, v1, p1}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    return-void
.end method

.method public userSelectedalternativeBilling(Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V
    .locals 4

    .line 3157
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 3158
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseCallbackApi.userSelectedalternativeBilling"

    invoke-direct {v0, v1, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    .line 3159
    new-instance v1, Ljava/util/ArrayList;

    .line 3160
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance p1, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi$$ExternalSyntheticLambda2;

    invoke-direct {p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V

    .line 3159
    invoke-virtual {v0, v1, p1}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    return-void
.end method
