.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private formattedPrice:Ljava/lang/String;

.field private priceAmountMicros:Ljava/lang/Long;

.field private priceCurrencyCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;
    .locals 2

    .line 438
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;-><init>()V

    .line 440
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->priceAmountMicros:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->setPriceAmountMicros(Ljava/lang/Long;)V

    .line 441
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->formattedPrice:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->setFormattedPrice(Ljava/lang/String;)V

    .line 442
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->priceCurrencyCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;->setPriceCurrencyCode(Ljava/lang/String;)V

    return-object v0
.end method

.method public setFormattedPrice(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;
    .locals 0

    .line 425
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->formattedPrice:Ljava/lang/String;

    return-object p0
.end method

.method public setPriceAmountMicros(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;
    .locals 0

    .line 417
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->priceAmountMicros:Ljava/lang/Long;

    return-object p0
.end method

.method public setPriceCurrencyCode(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;
    .locals 0

    .line 433
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->priceCurrencyCode:Ljava/lang/String;

    return-object p0
.end method
