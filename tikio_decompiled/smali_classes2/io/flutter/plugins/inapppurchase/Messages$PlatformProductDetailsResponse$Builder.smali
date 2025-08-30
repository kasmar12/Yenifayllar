.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

.field private productDetails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 717
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;
    .locals 2

    .line 736
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;-><init>()V

    .line 737
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;->setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)V

    .line 738
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;->productDetails:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;->setProductDetails(Ljava/util/List;)V

    return-object v0
.end method

.method public setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;
    .locals 0

    .line 723
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    return-object p0
.end method

.method public setProductDetails(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;"
        }
    .end annotation

    .line 731
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse$Builder;->productDetails:Ljava/util/List;

    return-object p0
.end method
