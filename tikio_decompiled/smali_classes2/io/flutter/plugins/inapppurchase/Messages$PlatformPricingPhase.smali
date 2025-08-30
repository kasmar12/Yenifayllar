.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformPricingPhase"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;
    }
.end annotation


# instance fields
.field private billingCycleCount:Ljava/lang/Long;

.field private billingPeriod:Ljava/lang/String;

.field private formattedPrice:Ljava/lang/String;

.field private priceAmountMicros:Ljava/lang/Long;

.field private priceCurrencyCode:Ljava/lang/String;

.field private recurrenceMode:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;"
        }
    .end annotation

    .line 1319
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;-><init>()V

    const/4 v1, 0x0

    .line 1320
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_1

    .line 1324
    :cond_0
    instance-of v3, v1, Ljava/lang/Integer;

    if-eqz v3, :cond_1

    .line 1325
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v3, v1

    goto :goto_0

    .line 1326
    :cond_1
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 1324
    :goto_0
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 1321
    :goto_1
    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setBillingCycleCount(Ljava/lang/Long;)V

    const/4 v1, 0x1

    .line 1327
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1328
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    move-result-object v3

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v1, v3, v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setRecurrenceMode(Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;)V

    const/4 v1, 0x2

    .line 1329
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2

    goto :goto_3

    .line 1333
    :cond_2
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 1334
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    goto :goto_2

    .line 1335
    :cond_3
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 1333
    :goto_2
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 1330
    :goto_3
    invoke-virtual {v0, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setPriceAmountMicros(Ljava/lang/Long;)V

    const/4 v1, 0x3

    .line 1336
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1337
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setBillingPeriod(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 1338
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1339
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setFormattedPrice(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 1340
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 1341
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->setPriceCurrencyCode(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getBillingCycleCount()Ljava/lang/Long;
    .locals 1

    .line 1166
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->billingCycleCount:Ljava/lang/Long;

    return-object v0
.end method

.method public getBillingPeriod()Ljava/lang/String;
    .locals 1

    .line 1205
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->billingPeriod:Ljava/lang/String;

    return-object v0
.end method

.method public getFormattedPrice()Ljava/lang/String;
    .locals 1

    .line 1218
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->formattedPrice:Ljava/lang/String;

    return-object v0
.end method

.method public getPriceAmountMicros()Ljava/lang/Long;
    .locals 1

    .line 1192
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->priceAmountMicros:Ljava/lang/Long;

    return-object v0
.end method

.method public getPriceCurrencyCode()Ljava/lang/String;
    .locals 1

    .line 1231
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->priceCurrencyCode:Ljava/lang/String;

    return-object v0
.end method

.method public getRecurrenceMode()Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;
    .locals 1

    .line 1179
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->recurrenceMode:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object v0
.end method

.method public setBillingCycleCount(Ljava/lang/Long;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1173
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->billingCycleCount:Ljava/lang/Long;

    return-void

    .line 1171
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"billingCycleCount\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setBillingPeriod(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1212
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->billingPeriod:Ljava/lang/String;

    return-void

    .line 1210
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"billingPeriod\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFormattedPrice(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1225
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->formattedPrice:Ljava/lang/String;

    return-void

    .line 1223
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"formattedPrice\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPriceAmountMicros(Ljava/lang/Long;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1199
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->priceAmountMicros:Ljava/lang/Long;

    return-void

    .line 1197
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"priceAmountMicros\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPriceCurrencyCode(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1238
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->priceCurrencyCode:Ljava/lang/String;

    return-void

    .line 1236
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"priceCurrencyCode\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setRecurrenceMode(Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1186
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->recurrenceMode:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-void

    .line 1184
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"recurrenceMode\" is null."

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

    .line 1308
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1309
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->billingCycleCount:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1310
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->recurrenceMode:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget v1, v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1311
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->priceAmountMicros:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1312
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->billingPeriod:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1313
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->formattedPrice:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1314
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;->priceCurrencyCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
