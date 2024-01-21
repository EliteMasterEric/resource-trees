package com.elitemastereric.resourcetrees.common.worldgen.grower;

import net.minecraft.resources.ResourceKey;
import net.minecraft.util.RandomSource;
import net.minecraft.world.level.levelgen.feature.ConfiguredFeature;
#if minecraft_lteq_1_20_2
//import net.minecraft.world.level.block.grower.AbstractTreeGrower;
#end
//import com.elitemastereric.resourcetrees.common.worldgen.features.TreeFeatures;

#if minecraft_lteq_1_20_2
// Minecraft 1.20.2 uses the AbstractTreeGrower class to represent tree terrain generation features.
class GoldTreeGrower extends AbstractTreeGrower {
    public overload function getConfiguredFeature(randomSource:RandomSource, hasFlowers:Bool):ResourceKey<ConfiguredFeature> {
        // return TreeFeatures.GOLD_TREE;
        return null;
    }
}
#end