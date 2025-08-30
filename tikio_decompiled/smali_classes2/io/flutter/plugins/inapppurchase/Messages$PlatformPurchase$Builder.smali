.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private accountIdentifiers:Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;

.field private developerPayload:Ljava/lang/String;

.field private isAcknowledged:Ljava/lang/Boolean;

.field private isAutoRenewing:Ljava/lang/Boolean;

.field private orderId:Ljava/lang/String;

.field private originalJson:Ljava/lang/String;

.field private packageName:Ljava/lang/String;

.field private products:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private purchaseState:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

.field private purchaseTime:Ljava/lang/Long;

.field private purchaseToken:Ljava/lang/String;

.field private quantity:Ljava/lang/Long;

.field private signature:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1520
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;
    .locals 2

    .line 1628
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;-><init>()V

    .line 1629
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->orderId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setOrderId(Ljava/lang/String;)V

    .line 1630
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setPackageName(Ljava/lang/String;)V

    .line 1631
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->purchaseTime:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setPurchaseTime(Ljava/lang/Long;)V

    .line 1632
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->purchaseToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setPurchaseToken(Ljava/lang/String;)V

    .line 1633
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->signature:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setSignature(Ljava/lang/String;)V

    .line 1634
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->products:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setProducts(Ljava/util/List;)V

    .line 1635
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->isAutoRenewing:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setIsAutoRenewing(Ljava/lang/Boolean;)V

    .line 1636
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->originalJson:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setOriginalJson(Ljava/lang/String;)V

    .line 1637
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->developerPayload:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setDeveloperPayload(Ljava/lang/String;)V

    .line 1638
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->isAcknowledged:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setIsAcknowledged(Ljava/lang/Boolean;)V

    .line 1639
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->quantity:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setQuantity(Ljava/lang/Long;)V

    .line 1640
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->purchaseState:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setPurchaseState(Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;)V

    .line 1641
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->accountIdentifiers:Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase;->setAccountIdentifiers(Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;)V

    return-object v0
.end method

.method public setAccountIdentifiers(Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1623
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->accountIdentifiers:Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;

    return-object p0
.end method

.method public setDeveloperPayload(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1590
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->developerPayload:Ljava/lang/String;

    return-object p0
.end method

.method public setIsAcknowledged(Ljava/lang/Boolean;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1598
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->isAcknowledged:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIsAutoRenewing(Ljava/lang/Boolean;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1574
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->isAutoRenewing:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setOrderId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1526
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->orderId:Ljava/lang/String;

    return-object p0
.end method

.method public setOriginalJson(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1582
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->originalJson:Ljava/lang/String;

    return-object p0
.end method

.method public setPackageName(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1534
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->packageName:Ljava/lang/String;

    return-object p0
.end method

.method public setProducts(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;"
        }
    .end annotation

    .line 1566
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->products:Ljava/util/List;

    return-object p0
.end method

.method public setPurchaseState(Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1614
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->purchaseState:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-object p0
.end method

.method public setPurchaseTime(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1542
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->purchaseTime:Ljava/lang/Long;

    return-object p0
.end method

.method public setPurchaseToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1550
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->purchaseToken:Ljava/lang/String;

    return-object p0
.end method

.method public setQuantity(Ljava/lang/Long;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1606
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->quantity:Ljava/lang/Long;

    return-object p0
.end method

.method public setSignature(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;
    .locals 0

    .line 1558
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchase$Builder;->signature:Ljava/lang/String;

    return-object p0
.end method
