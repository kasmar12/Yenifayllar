.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

.field private purchases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1951
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;
    .locals 2

    .line 1970
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;-><init>()V

    .line 1971
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;->setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)V

    .line 1972
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;->purchases:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;->setPurchases(Ljava/util/List;)V

    return-object v0
.end method

.method public setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;
    .locals 0

    .line 1957
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    return-object p0
.end method

.method public setPurchases(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;"
        }
    .end annotation

    .line 1965
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse$Builder;->purchases:Ljava/util/List;

    return-object p0
.end method
