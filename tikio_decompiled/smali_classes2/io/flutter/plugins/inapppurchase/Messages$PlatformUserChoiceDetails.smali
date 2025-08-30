.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformUserChoiceDetails"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;
    }
.end annotation


# instance fields
.field private externalTransactionToken:Ljava/lang/String;

.field private originalExternalTransactionId:Ljava/lang/String;

.field private products:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;"
        }
    .end annotation

    .line 2322
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;-><init>()V

    const/4 v1, 0x0

    .line 2323
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2324
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->setOriginalExternalTransactionId(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 2325
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2326
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->setExternalTransactionToken(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 2327
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 2328
    check-cast p0, Ljava/util/List;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->setProducts(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public getExternalTransactionToken()Ljava/lang/String;
    .locals 1

    .line 2251
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->externalTransactionToken:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalExternalTransactionId()Ljava/lang/String;
    .locals 1

    .line 2241
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->originalExternalTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method public getProducts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;",
            ">;"
        }
    .end annotation

    .line 2264
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->products:Ljava/util/List;

    return-object v0
.end method

.method public setExternalTransactionToken(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2258
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->externalTransactionToken:Ljava/lang/String;

    return-void

    .line 2256
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"externalTransactionToken\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOriginalExternalTransactionId(Ljava/lang/String;)V
    .locals 0

    .line 2245
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->originalExternalTransactionId:Ljava/lang/String;

    return-void
.end method

.method public setProducts(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 2271
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->products:Ljava/util/List;

    return-void

    .line 2269
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"products\" is null."

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

    .line 2314
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2315
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->originalExternalTransactionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2316
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->externalTransactionToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2317
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->products:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
