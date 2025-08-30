.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformUserChoiceProduct"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;
    }
.end annotation


# instance fields
.field private id:Ljava/lang/String;

.field private offerToken:Ljava/lang/String;

.field private type:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2376
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;"
        }
    .end annotation

    .line 2423
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;-><init>()V

    const/4 v1, 0x0

    .line 2424
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2425
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->setId(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 2426
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2427
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->setOfferToken(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 2428
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 2429
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object v1

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    aget-object p0, v1, p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->setType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)V

    return-object v0
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    .line 2342
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getOfferToken()Ljava/lang/String;
    .locals 1

    .line 2355
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->offerToken:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;
    .locals 1

    .line 2365
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->type:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object v0
.end method

.method public setId(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2349
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->id:Ljava/lang/String;

    return-void

    .line 2347
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"id\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOfferToken(Ljava/lang/String;)V
    .locals 0

    .line 2359
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->offerToken:Ljava/lang/String;

    return-void
.end method

.method public setType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2372
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->type:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-void

    .line 2370
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"type\" is null."

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

    .line 2415
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2416
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2417
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->offerToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2418
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->type:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget v1, v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
