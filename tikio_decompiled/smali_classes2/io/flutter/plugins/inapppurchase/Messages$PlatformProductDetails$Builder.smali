.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private description:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private oneTimePurchaseOfferDetails:Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

.field private productId:Ljava/lang/String;

.field private productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

.field private subscriptionOfferDetails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;",
            ">;"
        }
    .end annotation
.end field

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 569
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;
    .locals 2

    .line 630
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;-><init>()V

    .line 631
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setDescription(Ljava/lang/String;)V

    .line 632
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setName(Ljava/lang/String;)V

    .line 633
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->productId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setProductId(Ljava/lang/String;)V

    .line 634
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setProductType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)V

    .line 635
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setTitle(Ljava/lang/String;)V

    .line 636
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->oneTimePurchaseOfferDetails:Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setOneTimePurchaseOfferDetails(Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;)V

    .line 637
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->subscriptionOfferDetails:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setSubscriptionOfferDetails(Ljava/util/List;)V

    return-object v0
.end method

.method public setDescription(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    .locals 0

    .line 575
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    .locals 0

    .line 583
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->name:Ljava/lang/String;

    return-object p0
.end method

.method public setOneTimePurchaseOfferDetails(Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    .locals 0

    .line 616
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->oneTimePurchaseOfferDetails:Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    return-object p0
.end method

.method public setProductId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    .locals 0

    .line 591
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->productId:Ljava/lang/String;

    return-object p0
.end method

.method public setProductType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    .locals 0

    .line 599
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object p0
.end method

.method public setSubscriptionOfferDetails(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;"
        }
    .end annotation

    .line 625
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->subscriptionOfferDetails:Ljava/util/List;

    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    .locals 0

    .line 607
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->title:Ljava/lang/String;

    return-object p0
.end method
