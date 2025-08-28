.class Lio/flutter/plugins/inapppurchase/Translator;
.super Ljava/lang/Object;
.source "Translator.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static currencySymbolFromCode(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 334
    invoke-static {p0}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Currency;->getSymbol()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static fromAlternativeBillingOnlyReportingDetails(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/AlternativeBillingOnlyReportingDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse;
    .locals 1

    .line 314
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse$Builder;-><init>()V

    .line 315
    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->fromBillingResult(Lcom/android/billingclient/api/BillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse$Builder;->setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse$Builder;

    move-result-object p0

    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    .line 316
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/AlternativeBillingOnlyReportingDetails;->getExternalTransactionToken()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse$Builder;->setExternalTransactionToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse$Builder;

    move-result-object p0

    .line 317
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse;

    move-result-object p0

    return-object p0
.end method

.method static fromBillingConfig(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/BillingConfig;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;
    .locals 1

    .line 302
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;-><init>()V

    .line 303
    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->fromBillingResult(Lcom/android/billingclient/api/BillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;->setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;

    move-result-object p0

    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    .line 304
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingConfig;->getCountryCode()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {p0, p1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;->setCountryCode(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;

    move-result-object p0

    .line 305
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;

    move-result-object p0

    return-object p0
.end method

.method static fromBillingResult(Lcom/android/billingclient/api/BillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;
    .locals 3

    .line 262
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;-><init>()V

    .line 263
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;->setResponseCode(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;

    move-result-object v0

    .line 264
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingResult;->getDebugMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;->setDebugMessage(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;

    move-result-object p0

    .line 265
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    move-result-object p0

    return-object p0
.end method

.method static fromOneTimePurchaseOfferDetails(Lcom/android/billingclient/api/ProductDetails$OneTimePurchaseOfferDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;
    .locals 3

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 119
    :cond_0
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;-><init>()V

    .line 120
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$OneTimePurchaseOfferDetails;->getPriceAmountMicros()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->setPriceAmountMicros(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;

    move-result-object v0

    .line 121
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$OneTimePurchaseOfferDetails;->getPriceCurrencyCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->setPriceCurrencyCode(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;

    move-result-object v0

    .line 122
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$OneTimePurchaseOfferDetails;->getFormattedPrice()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->setFormattedPrice(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;

    move-result-object p0

    .line 123
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    move-result-object p0

    return-object p0
.end method

.method static fromPricingPhase(Lcom/android/billingclient/api/ProductDetails$PricingPhase;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;
    .locals 3

    .line 163
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;-><init>()V

    .line 164
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$PricingPhase;->getFormattedPrice()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->setFormattedPrice(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;

    move-result-object v0

    .line 165
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$PricingPhase;->getPriceCurrencyCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->setPriceCurrencyCode(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;

    move-result-object v0

    .line 166
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$PricingPhase;->getPriceAmountMicros()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->setPriceAmountMicros(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;

    move-result-object v0

    .line 167
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$PricingPhase;->getBillingCycleCount()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->setBillingCycleCount(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;

    move-result-object v0

    .line 168
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$PricingPhase;->getBillingPeriod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->setBillingPeriod(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;

    move-result-object v0

    .line 169
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$PricingPhase;->getRecurrenceMode()I

    move-result p0

    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->toPlatformRecurrenceMode(I)Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->setRecurrenceMode(Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;

    move-result-object p0

    .line 170
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;

    move-result-object p0

    return-object p0
.end method

.method static fromPricingPhases(Lcom/android/billingclient/api/ProductDetails$PricingPhases;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/ProductDetails$PricingPhases;",
            ")",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;",
            ">;"
        }
    .end annotation

    .line 154
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 155
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$PricingPhases;->getPricingPhaseList()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/ProductDetails$PricingPhase;

    .line 156
    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->fromPricingPhase(Lcom/android/billingclient/api/ProductDetails$PricingPhase;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static fromProductDetail(Lcom/android/billingclient/api/ProductDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;
    .locals 2

    .line 48
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;-><init>()V

    .line 49
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->setTitle(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    move-result-object v0

    .line 50
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->setDescription(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    move-result-object v0

    .line 51
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->setProductId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    move-result-object v0

    .line 52
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails;->getProductType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->toPlatformProductType(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->setProductType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    move-result-object v0

    .line 53
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->setName(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    move-result-object v0

    .line 55
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails;->getOneTimePurchaseOfferDetails()Lcom/android/billingclient/api/ProductDetails$OneTimePurchaseOfferDetails;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->fromOneTimePurchaseOfferDetails(Lcom/android/billingclient/api/ProductDetails$OneTimePurchaseOfferDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;

    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->setOneTimePurchaseOfferDetails(Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    move-result-object v0

    .line 57
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails;->getSubscriptionOfferDetails()Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->fromSubscriptionOfferDetailsList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->setSubscriptionOfferDetails(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;

    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;

    move-result-object p0

    return-object p0
.end method

.method static fromProductDetailsList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/ProductDetails;",
            ">;)",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 103
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 106
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 107
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/ProductDetails;

    .line 108
    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->fromProductDetail(Lcom/android/billingclient/api/ProductDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static fromPurchase(Lcom/android/billingclient/api/Purchase;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;
    .locals 3

    .line 198
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;-><init>()V

    .line 200
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getOrderId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setOrderId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 201
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setPackageName(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 202
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getPurchaseTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setPurchaseTime(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 203
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setPurchaseToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 204
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setSignature(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 205
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getProducts()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setProducts(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 206
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->isAutoRenewing()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setIsAutoRenewing(Ljava/lang/Boolean;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 207
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setOriginalJson(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 208
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getDeveloperPayload()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setDeveloperPayload(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 209
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->isAcknowledged()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setIsAcknowledged(Ljava/lang/Boolean;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 210
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v1

    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->toPlatformPurchaseState(I)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setPurchaseState(Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 211
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getQuantity()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setQuantity(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    move-result-object v0

    .line 212
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase;->getAccountIdentifiers()Lcom/android/billingclient/api/AccountIdentifiers;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 214
    new-instance v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;

    invoke-direct {v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;-><init>()V

    .line 216
    invoke-virtual {p0}, Lcom/android/billingclient/api/AccountIdentifiers;->getObfuscatedAccountId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;->setObfuscatedAccountId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;

    move-result-object v1

    .line 217
    invoke-virtual {p0}, Lcom/android/billingclient/api/AccountIdentifiers;->getObfuscatedProfileId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;->setObfuscatedProfileId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;

    move-result-object p0

    .line 218
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;

    move-result-object p0

    .line 214
    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->setAccountIdentifiers(Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;

    .line 220
    :cond_0
    invoke-virtual {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;

    move-result-object p0

    return-object p0
.end method

.method static fromPurchaseHistoryRecord(Lcom/android/billingclient/api/PurchaseHistoryRecord;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;
    .locals 3

    .line 225
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;-><init>()V

    .line 226
    invoke-virtual {p0}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getPurchaseTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->setPurchaseTime(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    move-result-object v0

    .line 227
    invoke-virtual {p0}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getPurchaseToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->setPurchaseToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    move-result-object v0

    .line 228
    invoke-virtual {p0}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->setSignature(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    move-result-object v0

    .line 229
    invoke-virtual {p0}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getProducts()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->setProducts(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    move-result-object v0

    .line 230
    invoke-virtual {p0}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getDeveloperPayload()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->setDeveloperPayload(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    move-result-object v0

    .line 231
    invoke-virtual {p0}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getOriginalJson()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->setOriginalJson(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    move-result-object v0

    .line 232
    invoke-virtual {p0}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getQuantity()I

    move-result p0

    int-to-long v1, p0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->setQuantity(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;

    move-result-object p0

    .line 233
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;

    move-result-object p0

    return-object p0
.end method

.method static fromPurchaseHistoryRecordList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/PurchaseHistoryRecord;",
            ">;)",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 251
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 254
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 255
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/PurchaseHistoryRecord;

    .line 256
    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->fromPurchaseHistoryRecord(Lcom/android/billingclient/api/PurchaseHistoryRecord;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static fromPurchasesList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 238
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 241
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 242
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/Purchase;

    .line 243
    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->fromPurchase(Lcom/android/billingclient/api/Purchase;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static fromSubscriptionOfferDetails(Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;
    .locals 2

    .line 143
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;-><init>()V

    .line 144
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;->getOfferId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->setOfferId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;

    move-result-object v0

    .line 145
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;->getBasePlanId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->setBasePlanId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;

    move-result-object v0

    .line 146
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;->getOfferTags()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->setOfferTags(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;

    move-result-object v0

    .line 147
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;->getOfferToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->setOfferToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;

    move-result-object v0

    .line 148
    invoke-virtual {p0}, Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;->getPricingPhases()Lcom/android/billingclient/api/ProductDetails$PricingPhases;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->fromPricingPhases(Lcom/android/billingclient/api/ProductDetails$PricingPhases;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->setPricingPhases(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;

    move-result-object p0

    .line 149
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;

    move-result-object p0

    return-object p0
.end method

.method static fromSubscriptionOfferDetailsList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;",
            ">;)",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 132
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 134
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;

    .line 135
    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->fromSubscriptionOfferDetails(Lcom/android/billingclient/api/ProductDetails$SubscriptionOfferDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static fromUserChoiceDetails(Lcom/android/billingclient/api/UserChoiceDetails;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;
    .locals 2

    .line 270
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;-><init>()V

    .line 271
    invoke-virtual {p0}, Lcom/android/billingclient/api/UserChoiceDetails;->getExternalTransactionToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->setExternalTransactionToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;

    move-result-object v0

    .line 272
    invoke-virtual {p0}, Lcom/android/billingclient/api/UserChoiceDetails;->getOriginalExternalTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->setOriginalExternalTransactionId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;

    move-result-object v0

    .line 273
    invoke-virtual {p0}, Lcom/android/billingclient/api/UserChoiceDetails;->getProducts()Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->fromUserChoiceProductsList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->setProducts(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;

    move-result-object p0

    .line 274
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;

    move-result-object p0

    return-object p0
.end method

.method static fromUserChoiceProduct(Lcom/android/billingclient/api/UserChoiceDetails$Product;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;
    .locals 2

    .line 292
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;-><init>()V

    .line 293
    invoke-virtual {p0}, Lcom/android/billingclient/api/UserChoiceDetails$Product;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->setId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;

    move-result-object v0

    .line 294
    invoke-virtual {p0}, Lcom/android/billingclient/api/UserChoiceDetails$Product;->getOfferToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->setOfferToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;

    move-result-object v0

    .line 295
    invoke-virtual {p0}, Lcom/android/billingclient/api/UserChoiceDetails$Product;->getType()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->toPlatformProductType(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->setType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;

    move-result-object p0

    .line 296
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;

    move-result-object p0

    return-object p0
.end method

.method static fromUserChoiceProductsList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/UserChoiceDetails$Product;",
            ">;)",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;",
            ">;"
        }
    .end annotation

    .line 279
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 280
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 283
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 284
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/UserChoiceDetails$Product;

    .line 285
    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->fromUserChoiceProduct(Lcom/android/billingclient/api/UserChoiceDetails$Product;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static toPlatformProductType(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;
    .locals 3

    .line 90
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x360a33

    const/4 v2, 0x2

    if-eq v0, v1, :cond_1

    const v1, 0x5fb1edc

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "inapp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    const-string v0, "subs"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x2

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, -0x1

    :goto_1
    if-eq p0, v2, :cond_3

    .line 94
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->INAPP:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object p0

    .line 96
    :cond_3
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->SUBS:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object p0
.end method

.method static toPlatformPurchaseState(I)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    .line 194
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->UNSPECIFIED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-object p0

    .line 190
    :cond_0
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->PENDING:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-object p0

    .line 188
    :cond_1
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->PURCHASED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-object p0

    .line 192
    :cond_2
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->UNSPECIFIED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-object p0
.end method

.method static toPlatformRecurrenceMode(I)Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    .line 182
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->NON_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object p0

    .line 180
    :cond_0
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->NON_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object p0

    .line 176
    :cond_1
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->FINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object p0

    .line 178
    :cond_2
    sget-object p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->INFINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object p0
.end method

.method static toProduct(Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product;
    .locals 2

    .line 73
    invoke-static {}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product;->newBuilder()Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v0

    .line 74
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;->getProductId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->setProductId(Ljava/lang/String;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v0

    .line 75
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;->getProductType()Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/inapppurchase/Translator;->toProductTypeString(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->setProductType(Ljava/lang/String;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object p0

    .line 76
    invoke-virtual {p0}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->build()Lcom/android/billingclient/api/QueryProductDetailsParams$Product;

    move-result-object p0

    return-object p0
.end method

.method static toProductList(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/QueryProductDetailsParams$Product;",
            ">;"
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;

    .line 65
    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Translator;->toProduct(Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static toProductTypeString(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)Ljava/lang/String;
    .locals 3

    .line 80
    sget-object v0, Lio/flutter/plugins/inapppurchase/Translator$1;->$SwitchMap$io$flutter$plugins$inapppurchase$Messages$PlatformProductType:[I

    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const-string p0, "subs"

    return-object p0

    .line 86
    :cond_0
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown product type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    const-string v2, "UNKNOWN_TYPE"

    invoke-direct {v0, v2, p0, v1}, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    :cond_1
    const-string p0, "inapp"

    return-object p0
.end method
