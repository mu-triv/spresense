############################################################################
# externals/cmsis/LibIncludes.mk
#
#   Copyright 2018 Sony Semiconductor Solutions Corporation
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materials provided with the
#    distribution.
# 3. Neither the name of Sony Semiconductor Solutions Corporation nor
#    the names of its contributors may be used to endorse or promote
#    products derived from this software without specific prior written
#    permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
############################################################################

ifeq ($(CONFIG_EXTERNALS_CMSIS),y)
CFLAGS += -DARM_MATH_CM4 -D__FPU_PRESENT=1U -D__ARM_FEATURE_MVE=0
CXXFLAGS += -DARM_MATH_CM4 -D__FPU_PRESENT=1U -D__ARM_FEATURE_MVE=0
endif

ifeq ($(CONFIG_EXTERNALS_CMSIS_DSP),y)
CFLAGS   += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/Core/Include"}
CXXFLAGS += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/Core/Include"}
CFLAGS   += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/DSP/Include"}
CXXFLAGS += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/DSP/Include"}
CFLAGS   += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/DSP/DSP_Lib_TestSuite/Common/inc"}
CXXFLAGS += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/DSP/DSP_Lib_TestSuite/Common/inc"}
endif

ifeq ($(CONFIG_EXTERNALS_CMSIS_NN),y)
CFLAGS   += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/NN/Include"}
CXXFLAGS += ${shell $(INCDIR) $(INCDIROPT) "$(CC)" "$(SDKDIR)/../externals/cmsis/CMSIS_5/CMSIS/NN/Include"}
endif
