package com.elitemastereric.resourcetrees.common.worldgen.grower;

import net.minecraft.world.level.block.grower.TreeGrower;
import java.util.Optional;

#if minecraft_gteq_1_20_4
class ModTreeGrowers {
	// Minecraft 1.20.3 or 1.20.4 reworks the AbstractTreeGrower class (whose only purpose is to return configured features) into a record class.
	public static final GOLD_WILLOW:TreeGrower = new TreeGrower("gold_willow", 0.0,
                Optional.empty(),
                Optional.empty(),
		Optional.empty(), // Optional.of(ModConfiguredFeatures.CHESTNUT_KEY),
		Optional.empty(),
                Optional.empty(),
                Optional.empty());
}
#end
