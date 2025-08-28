.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private basePlanId:Ljava/lang/String;

.field private offerId:Ljava/lang/String;

.field private offerTags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private offerToken:Ljava/lang/String;

.field private pricingPhases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;
    .locals 2

    .line 2195
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;-><init>()V

    .line 2196
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->basePlanId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;->setBasePlanId(Ljava/lang/String;)V

    .line 2197
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->offerId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;->setOfferId(Ljava/lang/String;)V

    .line 2198
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->offerToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;->setOfferToken(Ljava/lang/String;)V

    .line 2199
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->offerTags:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;->setOfferTags(Ljava/util/List;)V

    .line 2200
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->pricingPhases:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;->setPricingPhases(Ljava/util/List;)V

    return-object v0
.end method

.method public setBasePlanId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;
    .locals 0

    .line 2158
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->basePlanId:Ljava/lang/String;

    return-object p0
.end method

.method public setOfferId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;
    .locals 0

    .line 2166
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->offerId:Ljava/lang/String;

    return-object p0
.end method

.method public setOfferTags(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;"
        }
    .end annotation

    .line 2182
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->offerTags:Ljava/util/List;

    return-object p0
.end method

.method public setOfferToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;
    .locals 0

    .line 2174
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->offerToken:Ljava/lang/String;

    return-object p0
.end method

.method public setPricingPhases(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;"
        }
    .end annotation

    .line 2190
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->pricingPhases:Ljava/util/List;

    return-object p0
.end method
