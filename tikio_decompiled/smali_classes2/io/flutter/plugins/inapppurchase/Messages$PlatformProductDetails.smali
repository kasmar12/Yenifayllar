.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformProductDetails"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;
    }
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
.method constructor <init>()V
    .locals 0

    .line 567
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;"
        }
    .end annotation

    .line 657
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;-><init>()V

    const/4 v1, 0x0

    .line 658
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 659
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setDescription(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 660
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 661
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setName(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 662
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 663
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setProductId(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 664
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 665
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object v2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v1, v2, v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setProductType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)V

    const/4 v1, 0x4

    .line 666
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 667
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setTitle(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 668
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 672
    :cond_0
    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    move-result-object v1

    .line 669
    :goto_0
    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setOneTimePurchaseOfferDetails(Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;)V

    const/4 v1, 0x6

    .line 674
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 675
    check-cast p0, Ljava/util/List;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->setSubscriptionOfferDetails(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 482
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 495
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOneTimePurchaseOfferDetails()Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;
    .locals 1

    .line 547
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->oneTimePurchaseOfferDetails:Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    return-object v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    .line 508
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->productId:Ljava/lang/String;

    return-object v0
.end method

.method public getProductType()Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;
    .locals 1

    .line 521
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object v0
.end method

.method public getSubscriptionOfferDetails()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;",
            ">;"
        }
    .end annotation

    .line 558
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->subscriptionOfferDetails:Ljava/util/List;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 534
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 489
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->description:Ljava/lang/String;

    return-void

    .line 487
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"description\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 502
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->name:Ljava/lang/String;

    return-void

    .line 500
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"name\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOneTimePurchaseOfferDetails(Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;)V
    .locals 0

    .line 552
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->oneTimePurchaseOfferDetails:Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    return-void
.end method

.method public setProductId(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 515
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->productId:Ljava/lang/String;

    return-void

    .line 513
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"productId\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setProductType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 528
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-void

    .line 526
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"productType\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSubscriptionOfferDetails(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;",
            ">;)V"
        }
    .end annotation

    .line 563
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->subscriptionOfferDetails:Ljava/util/List;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 541
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->title:Ljava/lang/String;

    return-void

    .line 539
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"title\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 644
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 645
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 646
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 647
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->productId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 648
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    iget v1, v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 649
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 651
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->oneTimePurchaseOfferDetails:Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->toList()Ljava/util/ArrayList;

    move-result-object v2

    .line 650
    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 652
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;->subscriptionOfferDetails:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
