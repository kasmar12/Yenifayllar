.class public final synthetic Lcom/google/firebase/firestore/util/Util$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/firebase/firestore/util/Util$$ExternalSyntheticLambda4;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/firestore/util/Util$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Lcom/google/firebase/firestore/util/Util$$ExternalSyntheticLambda4;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/util/Util$$ExternalSyntheticLambda4;->INSTANCE:Lcom/google/firebase/firestore/util/Util$$ExternalSyntheticLambda4;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Ljava/lang/Comparable;

    check-cast p2, Ljava/lang/Comparable;

    invoke-static {p1, p2}, Lcom/google/firebase/firestore/util/Util;->lambda$diffCollections$2(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p1

    return p1
.end method
