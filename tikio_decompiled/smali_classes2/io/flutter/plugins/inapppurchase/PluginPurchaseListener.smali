.class Lio/flutter/plugins/inapppurchase/PluginPurchaseListener;
.super Ljava/lang/Object;
.source "PluginPurchaseListener.java"

# interfaces
.implements Lcom/android/billingclient/api/PurchasesUpdatedListener;


# instance fields
.field private final callbackApi:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;


# direct methods
.method constructor <init>(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/PluginPurchaseListener;->callbackApi:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;

    return-void
.end method


# virtual methods
.method public onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    .line 28
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;-><init>()V

    .line 30
    invoke-static {p1}, Lio/flutter/plugins/inapppurchase/Translator;->fromBillingResult(Lcom/android/billingclient/api/BillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;->setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;

    move-result-object p1

    .line 31
    invoke-static {p2}, Lio/flutter/plugins/inapppurchase/Translator;->fromPurchasesList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;->setPurchases(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;

    move-result-object p1

    .line 32
    iget-object p2, p0, Lio/flutter/plugins/inapppurchase/PluginPurchaseListener;->callbackApi:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;

    .line 33
    invoke-virtual {p1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;->build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;

    move-result-object p1

    new-instance v0, Lio/flutter/plugins/inapppurchase/PluginPurchaseListener$1;

    invoke-direct {v0, p0}, Lio/flutter/plugins/inapppurchase/PluginPurchaseListener$1;-><init>(Lio/flutter/plugins/inapppurchase/PluginPurchaseListener;)V

    .line 32
    invoke-virtual {p2, p1, v0}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->onPurchasesUpdated(Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V

    return-void
.end method
