.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformOneTimePurchaseOfferDetails"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;
    }
.end annotation


# instance fields
.field private formattedPrice:Ljava/lang/String;

.field private priceAmountMicros:Ljava/lang/Long;

.field private priceCurrencyCode:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 409
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;"
        }
    .end annotation

    .line 457
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;-><init>()V

    const/4 v1, 0x0

    .line 458
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 462
    :cond_0
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_1

    .line 463
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    goto :goto_0

    .line 464
    :cond_1
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 462
    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 459
    :goto_1
    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->setPriceAmountMicros(Ljava/lang/Long;)V

    const/4 v1, 0x1

    .line 465
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 466
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->setFormattedPrice(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 467
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 468
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->setPriceCurrencyCode(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getFormattedPrice()Ljava/lang/String;
    .locals 1

    .line 385
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->formattedPrice:Ljava/lang/String;

    return-object v0
.end method

.method public getPriceAmountMicros()Ljava/lang/Long;
    .locals 1

    .line 372
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->priceAmountMicros:Ljava/lang/Long;

    return-object v0
.end method

.method public getPriceCurrencyCode()Ljava/lang/String;
    .locals 1

    .line 398
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->priceCurrencyCode:Ljava/lang/String;

    return-object v0
.end method

.method public setFormattedPrice(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 392
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->formattedPrice:Ljava/lang/String;

    return-void

    .line 390
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"formattedPrice\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPriceAmountMicros(Ljava/lang/Long;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 379
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->priceAmountMicros:Ljava/lang/Long;

    return-void

    .line 377
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"priceAmountMicros\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPriceCurrencyCode(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 405
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->priceCurrencyCode:Ljava/lang/String;

    return-void

    .line 403
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"priceCurrencyCode\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 449
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 450
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->priceAmountMicros:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->formattedPrice:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 452
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->priceCurrencyCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
