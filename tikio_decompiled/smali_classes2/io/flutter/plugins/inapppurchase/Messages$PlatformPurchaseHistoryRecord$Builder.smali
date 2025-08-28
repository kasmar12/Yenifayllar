.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
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
.method public constructor <init>()V
    .locals 0

    .line 1805
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;
    .locals 2

    .line 1864
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;-><init>()V

    .line 1865
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->quantity:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setQuantity(Ljava/lang/Long;)V

    .line 1866
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->purchaseTime:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setPurchaseTime(Ljava/lang/Long;)V

    .line 1867
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->developerPayload:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setDeveloperPayload(Ljava/lang/String;)V

    .line 1868
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->originalJson:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setOriginalJson(Ljava/lang/String;)V

    .line 1869
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->purchaseToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setPurchaseToken(Ljava/lang/String;)V

    .line 1870
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->signature:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setSignature(Ljava/lang/String;)V

    .line 1871
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->products:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord;->setProducts(Ljava/util/List;)V

    return-object v0
.end method

.method public setDeveloperPayload(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    .locals 0

    .line 1827
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->developerPayload:Ljava/lang/String;

    return-object p0
.end method

.method public setOriginalJson(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    .locals 0

    .line 1835
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->originalJson:Ljava/lang/String;

    return-object p0
.end method

.method public setProducts(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;"
        }
    .end annotation

    .line 1859
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->products:Ljava/util/List;

    return-object p0
.end method

.method public setPurchaseTime(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    .locals 0

    .line 1819
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->purchaseTime:Ljava/lang/Long;

    return-object p0
.end method

.method public setPurchaseToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    .locals 0

    .line 1843
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->purchaseToken:Ljava/lang/String;

    return-object p0
.end method

.method public setQuantity(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    .locals 0

    .line 1811
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->quantity:Ljava/lang/Long;

    return-object p0
.end method

.method public setSignature(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;
    .locals 0

    .line 1851
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseHistoryRecord$Builder;->signature:Ljava/lang/String;

    return-object p0
.end method
