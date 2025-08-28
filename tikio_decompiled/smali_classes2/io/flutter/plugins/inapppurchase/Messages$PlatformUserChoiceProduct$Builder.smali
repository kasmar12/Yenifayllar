.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private id:Ljava/lang/String;

.field private offerToken:Ljava/lang/String;

.field private type:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2378
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;
    .locals 2

    .line 2405
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;-><init>()V

    .line 2406
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->setId(Ljava/lang/String;)V

    .line 2407
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->offerToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->setOfferToken(Ljava/lang/String;)V

    .line 2408
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->type:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;->setType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)V

    return-object v0
.end method

.method public setId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;
    .locals 0

    .line 2384
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->id:Ljava/lang/String;

    return-object p0
.end method

.method public setOfferToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;
    .locals 0

    .line 2392
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->offerToken:Ljava/lang/String;

    return-object p0
.end method

.method public setType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;
    .locals 0

    .line 2400
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct$Builder;->type:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object p0
.end method
