.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
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
.method public constructor <init>()V
    .locals 0

    .line 2277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;
    .locals 2

    .line 2304
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;-><init>()V

    .line 2305
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->originalExternalTransactionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->setOriginalExternalTransactionId(Ljava/lang/String;)V

    .line 2306
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->externalTransactionToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->setExternalTransactionToken(Ljava/lang/String;)V

    .line 2307
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->products:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails;->setProducts(Ljava/util/List;)V

    return-object v0
.end method

.method public setExternalTransactionToken(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;
    .locals 0

    .line 2291
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->externalTransactionToken:Ljava/lang/String;

    return-object p0
.end method

.method public setOriginalExternalTransactionId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;
    .locals 0

    .line 2283
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->originalExternalTransactionId:Ljava/lang/String;

    return-object p0
.end method

.method public setProducts(Ljava/util/List;)Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceProduct;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;"
        }
    .end annotation

    .line 2299
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformUserChoiceDetails$Builder;->products:Ljava/util/List;

    return-object p0
.end method
