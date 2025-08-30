.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private billingCycleCount:Ljava/lang/Long;

.field private billingPeriod:Ljava/lang/String;

.field private formattedPrice:Ljava/lang/String;

.field private priceAmountMicros:Ljava/lang/Long;

.field private priceCurrencyCode:Ljava/lang/String;

.field private recurrenceMode:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;
    .locals 2

    .line 1295
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;-><init>()V

    .line 1296
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->billingCycleCount:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setBillingCycleCount(Ljava/lang/Long;)V

    .line 1297
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->recurrenceMode:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setRecurrenceMode(Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;)V

    .line 1298
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->priceAmountMicros:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setPriceAmountMicros(Ljava/lang/Long;)V

    .line 1299
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->billingPeriod:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setBillingPeriod(Ljava/lang/String;)V

    .line 1300
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->formattedPrice:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setFormattedPrice(Ljava/lang/String;)V

    .line 1301
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->priceCurrencyCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setPriceCurrencyCode(Ljava/lang/String;)V

    return-object v0
.end method

.method public setBillingCycleCount(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
    .locals 0

    .line 1250
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->billingCycleCount:Ljava/lang/Long;

    return-object p0
.end method

.method public setBillingPeriod(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
    .locals 0

    .line 1274
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->billingPeriod:Ljava/lang/String;

    return-object p0
.end method

.method public setFormattedPrice(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
    .locals 0

    .line 1282
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->formattedPrice:Ljava/lang/String;

    return-object p0
.end method

.method public setPriceAmountMicros(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
    .locals 0

    .line 1266
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->priceAmountMicros:Ljava/lang/Long;

    return-object p0
.end method

.method public setPriceCurrencyCode(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
    .locals 0

    .line 1290
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->priceCurrencyCode:Ljava/lang/String;

    return-object p0
.end method

.method public setRecurrenceMode(Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
    .locals 0

    .line 1258
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->recurrenceMode:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object p0
.end method
