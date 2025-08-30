.class public Lio/flutter/plugins/inapppurchase/Messages;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$FlutterError;,
        Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;,
        Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApiCodec;,
        Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApi;,
        Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseApiCodec;,
        Lio/flutter/plugins/inapppurchase/Messages$VoidResult;,
        Lio/flutter/plugins/inapppurchase/Messages$NullableResult;,
        Lio/flutter/plugins/inapppurchase/Messages$Result;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformSubscriptionOfferDetails;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryResponse;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPricingPhase;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingFlowParams;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformAlternativeBillingOnlyReportingDetailsResponse;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetailsResponse;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformProductDetails;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformOneTimePurchaseOfferDetails;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;,
        Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;,
        Lio/flutter/plugins/inapppurchase/Messages$CanIgnoreReturnValue;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static createConnectionError(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$FlutterError;
    .locals 3

    .line 66
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to establish connection on channel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "channel-error"

    const-string v2, ""

    invoke-direct {v0, v1, p0, v2}, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected static wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 50
    instance-of v1, p0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    if-eqz v1, :cond_0

    .line 51
    check-cast p0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;

    .line 52
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;->code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    invoke-virtual {p0}, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object p0, p0, Lio/flutter/plugins/inapppurchase/Messages$FlutterError;->details:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cause: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", Stacktrace: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-object v0
.end method
