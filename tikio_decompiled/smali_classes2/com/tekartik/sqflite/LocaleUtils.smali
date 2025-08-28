.class public Lcom/tekartik/sqflite/LocaleUtils;
.super Ljava/lang/Object;
.source "LocaleUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static localeForLanguageTag21(Ljava/lang/String;)Ljava/util/Locale;
    .locals 0

    .line 22
    invoke-static {p0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    return-object p0
.end method

.method static localeForLanguageTagPre21(Ljava/lang/String;)Ljava/util/Locale;
    .locals 6

    const-string v0, "-"

    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 38
    array-length v0, p0

    const-string v1, ""

    if-lez v0, :cond_2

    const/4 v0, 0x0

    .line 39
    aget-object v0, p0, v0

    .line 40
    array-length v2, p0

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    .line 41
    aget-object v2, p0, v3

    .line 43
    array-length v4, p0

    const/4 v5, 0x2

    if-le v4, v5, :cond_0

    .line 44
    array-length v1, p0

    sub-int/2addr v1, v3

    aget-object v1, p0, v1

    :cond_0
    move-object p0, v1

    goto :goto_0

    :cond_1
    move-object p0, v1

    move-object v2, p0

    :goto_0
    move-object v1, v0

    goto :goto_1

    :cond_2
    move-object p0, v1

    move-object v2, p0

    .line 48
    :goto_1
    new-instance v0, Ljava/util/Locale;

    invoke-direct {v0, v1, v2, p0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static localeForLanguateTag(Ljava/lang/String;)Ljava/util/Locale;
    .locals 2

    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 14
    invoke-static {p0}, Lcom/tekartik/sqflite/LocaleUtils;->localeForLanguageTag21(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    return-object p0

    .line 16
    :cond_0
    invoke-static {p0}, Lcom/tekartik/sqflite/LocaleUtils;->localeForLanguageTagPre21(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    return-object p0
.end method
