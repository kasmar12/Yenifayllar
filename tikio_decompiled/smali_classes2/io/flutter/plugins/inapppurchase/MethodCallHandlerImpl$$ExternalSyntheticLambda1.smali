.class public final synthetic Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/billingclient/api/AlternativeBillingOnlyAvailabilityListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/inapppurchase/Messages$Result;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/inapppurchase/Messages$Result;

    return-void
.end method


# virtual methods
.method public final onAlternativeBillingOnlyAvailabilityResponse(Lcom/android/billingclient/api/BillingResult;)V
    .locals 1

    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/inapppurchase/Messages$Result;

    invoke-static {v0, p1}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->lambda$isAlternativeBillingOnlyAvailableAsync$2(Lio/flutter/plugins/inapppurchase/Messages$Result;Lcom/android/billingclient/api/BillingResult;)V

    return-void
.end method
