.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

.field private countryCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 886
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;
    .locals 2

    .line 905
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;-><init>()V

    .line 906
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;->setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)V

    .line 907
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;->countryCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse;->setCountryCode(Ljava/lang/String;)V

    return-object v0
.end method

.method public setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;
    .locals 0

    .line 892
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    return-object p0
.end method

.method public setCountryCode(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;
    .locals 0

    .line 900
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingConfigResponse$Builder;->countryCode:Ljava/lang/String;

    return-object p0
.end method
