.class public final synthetic Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/util/ViewUtils$ViewVisitor;


# static fields
.field public static final synthetic INSTANCE:Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;-><init>()V

    sput-object v0, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;->INSTANCE:Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Landroid/view/View;)Z
    .locals 0

    invoke-static {p1}, Lio/flutter/util/ViewUtils;->lambda$childHasFocus$0(Landroid/view/View;)Z

    move-result p1

    return p1
.end method
