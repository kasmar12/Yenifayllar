.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformPurchasesResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse$Builder;
    }
.end annotation


# instance fields
.field private billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

.field private purchases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2032
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;"
        }
    .end annotation

    .line 2069
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;-><init>()V

    const/4 v1, 0x0

    .line 2070
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 2074
    :cond_0
    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    move-result-object v1

    .line 2071
    :goto_0
    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)V

    const/4 v1, 0x1

    .line 2075
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 2076
    check-cast p0, Ljava/util/List;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->setPurchases(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public getBillingResult()Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;
    .locals 1

    .line 2008
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    return-object v0
.end method

.method public getPurchases()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;",
            ">;"
        }
    .end annotation

    .line 2021
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->purchases:Ljava/util/List;

    return-object v0
.end method

.method public setBillingResult(Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2015
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    return-void

    .line 2013
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"billingResult\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPurchases(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 2028
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->purchases:Ljava/util/List;

    return-void

    .line 2026
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"purchases\" is null."

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

    .line 2062
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2063
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->billingResult:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;->toList()Ljava/util/ArrayList;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2064
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchasesResponse;->purchases:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
