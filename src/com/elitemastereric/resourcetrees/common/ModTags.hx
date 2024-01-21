package com.elitemastereric.resourcetrees.common;

import net.minecraft.core.registries.Registries;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.tags.TagKey;
import net.minecraft.world.item.Item;
import net.minecraft.world.level.block.Block;

class ModTags {
    /**
     * ITEM TAGS
     */
    public static final ITEM_GOLD_LOGS:TagKey<Item> = TagKey.create(Registries.ITEM, new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_log"));

    /**
     * BLOCK TAGS
     */
    public static final BLOCK_GOLD_LOGS:TagKey<Block> = TagKey.create(Registries.BLOCK, new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_log"));
}