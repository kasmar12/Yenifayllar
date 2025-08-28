.class public interface abstract Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "InAppPurchaseApi"
.end annotation


# virtual methods
.method public abstract acknowledgePurchase(Ljava/lang/String;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract consumeAsync(Ljava/lang/String;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract createAlternativeBillingOnlyReportingDetailsAsync(Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract endConnection()V
.end method

.method public abstract getBillingConfigAsync(Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract isAlternativeBillingOnlyAvailableAsync(Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract isFeatureSupported(Ljava/lang/String;)Ljava/lang/Boolean;
.end method

.method public abstract isReady()Ljava/lang/Boolean;
.end method

.method public abstract launchBillingFlow(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingFlowParams;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;
.end method

.method public abstract queryProductDetailsAsync(Ljava/util/List;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;",
            ">;",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract queryPurchaseHistoryAsync(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract queryPurchasesAsync(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract showAlternativeBillingOnlyInformationDialog(Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract startConnection(Ljava/lang/Long;Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;",
            "Lio/flutter/plugins/inapppurchase/Messages$Result<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;",
            ">;)V"
        }
    .end annotation
.end method
