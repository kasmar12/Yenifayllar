.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private debugMessage:Ljava/lang/String;

.field private responseCode:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;
    .locals 2

    .line 335
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;-><init>()V

    .line 336
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;->responseCode:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;->setResponseCode(Ljava/lang/Long;)V

    .line 337
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;->debugMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;->setDebugMessage(Ljava/lang/String;)V

    return-object v0
.end method

.method public setDebugMessage(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;
    .locals 0

    .line 330
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;->debugMessage:Ljava/lang/String;

    return-object p0
.end method

.method public setResponseCode(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;
    .locals 0

    .line 322
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult$Builder;->responseCode:Ljava/lang/Long;

    return-object p0
.end method
