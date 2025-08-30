.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformPurchaseHistoryRecord"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    }
.end annotation


# instance fields
.field private developerPayload:Ljava/lang/String;

.field private originalJson:Ljava/lang/String;

.field private products:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private purchaseTime:Ljava/lang/Long;

.field private purchaseToken:Ljava/lang/String;

.field private quantity:Ljava/lang/Long;

.field private signature:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1803
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;"
        }
    .end annotation

    .line 1890
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;-><init>()V

    const/4 v1, 0x0

    .line 1891
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_1

    .line 1895
    :cond_0
    instance-of v3, v1, Ljava/lang/Integer;

    if-eqz v3, :cond_1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v3, v1

    goto :goto_0

    :cond_1
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    :goto_0
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 1892
    :goto_1
    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setQuantity(Ljava/lang/Long;)V

    const/4 v1, 0x1

    .line 1896
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2

    goto :goto_3

    .line 1900
    :cond_2
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    goto :goto_2

    :cond_3
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_2
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 1897
    :goto_3
    invoke-virtual {v0, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setPurchaseTime(Ljava/lang/Long;)V

    const/4 v1, 0x2

    .line 1901
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1902
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setDeveloperPayload(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 1903
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1904
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setOriginalJson(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 1905
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1906
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setPurchaseToken(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 1907
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1908
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setSignature(Ljava/lang/String;)V

    const/4 v1, 0x6

    .line 1909
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 1910
    check-cast p0, Ljava/util/List;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setProducts(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public getDeveloperPayload()Ljava/lang/String;
    .locals 1

    .line 1743
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->developerPayload:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalJson()Ljava/lang/String;
    .locals 1

    .line 1753
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->originalJson:Ljava/lang/String;

    return-object v0
.end method

.method public getProducts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1792
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->products:Ljava/util/List;

    return-object v0
.end method

.method public getPurchaseTime()Ljava/lang/Long;
    .locals 1

    .line 1730
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->purchaseTime:Ljava/lang/Long;

    return-object v0
.end method

.method public getPurchaseToken()Ljava/lang/String;
    .locals 1

    .line 1766
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->purchaseToken:Ljava/lang/String;

    return-object v0
.end method

.method public getQuantity()Ljava/lang/Long;
    .locals 1

    .line 1717
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->quantity:Ljava/lang/Long;

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .locals 1

    .line 1779
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->signature:Ljava/lang/String;

    return-object v0
.end method

.method public setDeveloperPayload(Ljava/lang/String;)V
    .locals 0

    .line 1747
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->developerPayload:Ljava/lang/String;

    return-void
.end method

.method public setOriginalJson(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1760
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->originalJson:Ljava/lang/String;

    return-void

    .line 1758
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"originalJson\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setProducts(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 1799
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->products:Ljava/util/List;

    return-void

    .line 1797
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"products\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPurchaseTime(Ljava/lang/Long;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1737
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->purchaseTime:Ljava/lang/Long;

    return-void

    .line 1735
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"purchaseTime\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPurchaseToken(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1773
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->purchaseToken:Ljava/lang/String;

    return-void

    .line 1771
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"purchaseToken\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setQuantity(Ljava/lang/Long;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1724
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->quantity:Ljava/lang/Long;

    return-void

    .line 1722
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"quantity\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSignature(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1786
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->signature:Ljava/lang/String;

    return-void

    .line 1784
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"signature\" is null."

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

    .line 1878
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1879
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->quantity:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1880
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->purchaseTime:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1881
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->developerPayload:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1882
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->originalJson:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1883
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->purchaseToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1884
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->signature:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1885
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->products:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
