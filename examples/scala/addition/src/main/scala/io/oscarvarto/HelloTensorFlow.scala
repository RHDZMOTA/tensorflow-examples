// Copyright (C) 2018 the original author or authors.
// See the LICENCE.txt file distributed with this work for additional
// information regarding copyright ownership.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package io.oscarvarto

import org.platanios.tensorflow.api.Tensor
import org.platanios.tensorflow.api.tensorToMathOps

object HelloTensorFlow extends App {
  val t1 = Tensor( 1.2, 4.5)
  val t2 = Tensor(-0.2, 1.1)
  val sum = t1 + t2 // Tensor(1.0, 5.6)
  val summary = sum.summarize(maxEntries = 2, flattened = true, includeInfo = true)
  println(summary)
}
